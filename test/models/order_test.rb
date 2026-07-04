require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # The repo's scaffold fixtures predate the current schema (e.g. products no
  # longer has a `category` column) and no test ever loaded them. Build data
  # inline instead of pulling in the stale `fixtures :all` set.
  self.fixture_table_names = []

  setup do
    @category = Category.create!(name_en: "Rings", name_ar: "خواتم", slug: "rings-#{SecureRandom.hex(4)}")
    @sub_category = SubCategory.create!(
      name_en: "Gold Rings", name_ar: "خواتم ذهب",
      slug: "gold-rings-#{SecureRandom.hex(4)}", category: @category, position: 0
    )
    secret = SecureRandom.hex(12)
    @user = User.create!(
      name: "Buyer", phone: "+96170000000",
      email: "buyer-#{SecureRandom.hex(4)}@example.com",
      password: secret, password_confirmation: secret
    )
  end

  def create_product(stock:)
    Product.create!(
      name_en: "Ring", name_ar: "خاتم", price: 100,
      stock_quantity: stock, sub_category: @sub_category,
      slug: "ring-#{SecureRandom.hex(4)}"
    )
  end

  def build_order(product:, quantity: 1, **attrs)
    order = Order.new({
      user: @user,
      name: "Buyer", email: "buyer@example.com", phone: "+96170000000",
      country: "Lebanon", city: "Beirut", street_address: "123 Test St",
      status: "pending", payment_status: "pending"
    }.merge(attrs))
    order.order_items.build(product: product, quantity: quantity, unit_price: 10)
    order.save!
    order
  end

  test "update_totals! folds the COD fee into the total" do
    order = build_order(product: create_product(stock: 5), quantity: 2)

    order.update_totals!(Setting.current, shipping_override: 5, cod_fee_override: 10)

    assert_equal 20, order.subtotal
    assert_equal 5, order.shipping_amount
    assert_equal 10, order.cod_fee
    assert_equal 35, order.total_amount # 20 - 0 discount + 5 shipping + 10 COD
  end

  test "update_totals! without a COD override keeps the fee at zero" do
    order = build_order(product: create_product(stock: 5), quantity: 1)

    order.update_totals!(Setting.current, shipping_override: 5)

    assert_equal 0, order.cod_fee
    assert_equal 15, order.total_amount
  end

  test "place_cod_order! reserves stock and marks the order pending" do
    product = create_product(stock: 5)
    order = build_order(product: product, quantity: 2, status: "payment_pending", payment_method: "cod")

    order.place_cod_order!

    assert_equal "pending", order.status
    assert_equal "pending", order.payment_status
    assert order.stock_decremented?
    assert_equal 3, product.reload.stock_quantity
  end

  test "decrement_stock! is idempotent" do
    product = create_product(stock: 5)
    order = build_order(product: product, quantity: 2)

    order.decrement_stock!
    order.decrement_stock!

    assert_equal 3, product.reload.stock_quantity
  end

  test "confirm_payment! on a placed COD order does not decrement stock twice" do
    product = create_product(stock: 5)
    order = build_order(product: product, quantity: 2, status: "pending", payment_method: "cod")
    order.place_cod_order!
    assert_equal 3, product.reload.stock_quantity

    order.confirm_payment! # admin collects the cash on delivery

    assert_equal "paid", order.payment_status
    assert_equal 3, product.reload.stock_quantity
  end

  test "cancel_order! restores stock for a placed COD order never paid online" do
    product = create_product(stock: 5)
    order = build_order(product: product, quantity: 2, status: "pending", payment_method: "cod")
    order.place_cod_order!
    assert_equal 3, product.reload.stock_quantity

    order.cancel_order!

    assert_equal "canceled", order.status
    assert_not order.stock_decremented?
    assert_equal 5, product.reload.stock_quantity
  end

  test "cancel_order! does not restore stock when nothing was decremented" do
    product = create_product(stock: 5)
    order = build_order(product: product, quantity: 2, status: "payment_pending")

    order.cancel_order!

    assert_equal 5, product.reload.stock_quantity
  end

  test "payment_method must be a known value" do
    order = build_order(product: create_product(stock: 5))

    order.payment_method = "bitcoin"
    assert_not order.valid?
    assert_includes order.errors.attribute_names, :payment_method

    order.payment_method = "cod"
    assert order.valid?
  end

  test "cod? reflects the payment method" do
    assert build_order(product: create_product(stock: 5), payment_method: "cod").cod?
    assert_not build_order(product: create_product(stock: 5), payment_method: "card").cod?
  end
end
