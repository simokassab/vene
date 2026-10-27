require "test_helper"
require_relative "../support/variant_catalog"

class VariantCombinationsTest < ActionDispatch::IntegrationTest
  include VariantCatalog
  include Devise::Test::IntegrationHelpers

  self.fixture_table_names = []

  setup do
    build_catalog
    Setting.current
    photo(@yellow, position: 0)
    photo(@rose, position: 1)
    sync([ row(@yellow, @s52, stock: 2), row(@rose, @s52, stock: 0), row(@rose, @s54, stock: 3) ])
  end

  test "the product page carries every combination and the photos per color" do
    get product_path(@product.slug, locale: :en)

    assert_response :success
    config = JSON.parse(css_select("[x-data^='productPage(']").first["x-data"][/\Aproductpage\((.*)\)\z/mi, 1])
    picker = config.fetch("picker")
    assert_equal [ @color.id, @size.id ], picker["types"].map { |t| t["id"] }
    assert picker["types"].first["options"].find { |o| o["id"] == @yellow.id }["default"]
    assert_equal 3, picker["variants"].size
    assert_not picker["variants"].find { |v| v["options"].sort == [ @rose.id, @s52.id ].sort }["purchasable"]
    assert_equal [ @yellow.id.to_s, @rose.id.to_s ].sort, picker["images"]["byOption"].keys.sort
  end

  test "a combination goes in the bag and shows its color and size" do
    variant = variant_for(@rose, @s54)
    post add_item_cart_path(locale: :en), params: { product_id: @product.id, product_variant_id: variant.id, quantity: 1 }
    get cart_path(locale: :en)

    assert_response :success
    assert_includes response.body, "Rose gold · #{@size.name} 54"
  end

  test "a sold-out combination is refused" do
    variant = variant_for(@rose, @s52)
    post add_item_cart_path(locale: :en), params: { product_id: @product.id, product_variant_id: variant.id, quantity: 1 }
    get cart_path(locale: :en)

    assert_not_includes response.body, "Rose gold · #{@size.name} 52"
  end

  test "the admin grid saves stock per combination and tags photos with a color" do
    sign_in create_admin, scope: :admin_user
    image = @product.product_images.first
    patch admin_product_path(@product, locale: :en), params: { product: {
      name_en: @product.name_en,
      product_images_attributes: { "0" => { id: image.id, variant_option_id: @rose.id } },
      variant_matrix: { submitted: "1", rows: {
        "0" => { option_ids: [ @yellow.id, @s52.id ], stock_quantity: "5", allow_preorder: "0", active: "1" },
        "1" => { option_ids: [ @yellow.id, @s54.id ], stock_quantity: "0", allow_preorder: "1", active: "1" }
      } }
    } }

    assert_redirected_to admin_products_path(locale: :en)
    assert_equal 5, variant_for(@yellow, @s52).stock_quantity
    assert variant_for(@yellow, @s54).allow_preorder?
    assert_nil variant_for(@rose, @s54), "combinations left out of the grid are removed"
    assert_equal @rose.id, image.reload.variant_option_id
  end

  test "the admin grid keeps a deactivated type the product still sells" do
    sign_in create_admin, scope: :admin_user
    @size.update!(active: false)
    get edit_admin_product_path(@product, locale: :en)

    assert_response :success
    data = JSON.parse(css_select("[x-data^='variantMatrix(']").first["x-data"][/\AvariantMatrix\((.*)\)\z/m, 1])
    assert_includes data["types"].map { |t| t["id"] }, @size.id
    assert_includes data["selectedTypes"], @size.id
  end

  private

  def create_admin
    secret = SecureRandom.hex(12)
    User.create!(name: "Admin Person", phone: "+96170000000", email: "admin-#{SecureRandom.hex(4)}@example.com",
                 password: secret, password_confirmation: secret, role: "admin")
  end
end
