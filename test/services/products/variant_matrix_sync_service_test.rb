require "test_helper"
require_relative "../../support/variant_catalog"

class Products::VariantMatrixSyncServiceTest < ActiveSupport::TestCase
  include VariantCatalog

  self.fixture_table_names = []

  setup { build_catalog }

  test "creates one variant per row, sold-out rows included" do
    result = sync([ row(@yellow, @s52, stock: 3), row(@rose, @s52, stock: 0), row(@rose, @s54, stock: 0, preorder: true) ])

    assert result.success?
    assert_equal 3, @product.product_variants.count
    assert_equal 0, variant_for(@rose, @s52).stock_quantity
    assert variant_for(@rose, @s54).allow_preorder?
  end

  test "saving the same grid again updates in place and keeps ids" do
    sync([ row(@yellow, @s52, stock: 3) ])
    id = variant_for(@yellow, @s52).id

    sync([ row(@yellow, @s52, stock: 7, id: id) ])
    sync([ row(@yellow, @s52, stock: 9) ]) # no id: matched by combination

    assert_equal [ id ], @product.product_variants.pluck(:id)
    assert_equal 9, variant_for(@yellow, @s52).stock_quantity
  end

  test "a combination left out is deleted, or deactivated when it was ordered" do
    sync([ row(@yellow, @s52), row(@rose, @s52), row(@rose, @s54) ])
    ordered = variant_for(@rose, @s52)
    order = Order.new(name: "Layla Haddad", email: "l@example.com", phone: "+96170000000", country: "Lebanon",
                      city: "Beirut", street_address: "Rue Gouraud 12", status: "paid", payment_status: "paid")
    order[:address] = "Rue Gouraud 12" # the text column, shadowed by the address association
    order.order_items.build(product: @product, product_variant: ordered, quantity: 1, unit_price: 100, line_total: 100)
    order.save!(validate: false)

    assert sync([ row(@yellow, @s52) ]).success?

    assert_not ordered.reload.active?, "an ordered combination is kept for order history"
    assert_nil variant_for(@rose, @s54), "a never-ordered combination is removed"
  end

  test "adding a combination back reactivates the retired variant" do
    sync([ row(@yellow, @s52), row(@rose, @s52) ])
    retired = variant_for(@rose, @s52)
    WishlistItem.create!(user: create_user, product: @product, product_variant: retired, price_when_added: 100)
    sync([ row(@yellow, @s52) ])
    assert_not retired.reload.active?

    sync([ row(@yellow, @s52), row(@rose, @s52) ])
    assert retired.reload.active?
  end

  test "a legacy single-option variant becomes a combination row" do
    legacy = @product.product_variants.create!(variant_type: @size, variant_option: @s52, stock_quantity: 2)

    assert sync([ row(@s52, stock: 5) ]).success?
    legacy.reload
    assert_equal [ @s52.id ], legacy.option_ids
    assert_nil legacy.variant_option_id
    assert_equal 5, legacy.stock_quantity
  end

  test "an invalid row rolls the whole save back" do
    sync([ row(@yellow, @s52, stock: 3) ])
    bad = row(@rose, @s52, preorder: true).merge(preorder_estimated_delivery_date: 1.day.ago.to_date.iso8601)

    result = sync([ row(@yellow, @s52, stock: 8), bad ])

    assert_not result.success?
    assert_equal 3, variant_for(@yellow, @s52).stock_quantity
    assert_nil variant_for(@rose, @s52)
  end

  private

  def create_user
    secret = SecureRandom.hex(12)
    User.create!(name: "Layla Haddad", phone: "+96170000000", email: "u-#{SecureRandom.hex(4)}@example.com",
                 password: secret, password_confirmation: secret)
  end
end
