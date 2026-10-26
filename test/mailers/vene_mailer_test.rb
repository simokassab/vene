require "test_helper"

# Renders the VENÈ email templates from unsaved records, so they do not depend on fixtures.
class VeneMailerTest < ActionMailer::TestCase
  self.fixture_table_names = []

  setup do
    @product = Product.new(name_en: "Vetra Ring", name_ar: "خاتم فيترا", slug: "vetra-ring", price: 2762, metal: "18K Yellow Gold")
    @user = User.new(name: "Layla Haddad", email: "layla@example.com")
  end

  test "order confirmation uses the EmailPurchase layout with compact prices" do
    order = Order.new(id: 42, name: "Layla Haddad", email: "layla@example.com", phone: "+96170000000", country: "Lebanon",
                      city: "Beirut", street_address: "Rue Gouraud 12", subtotal: 2762, shipping_amount: 35,
                      total_amount: 2797, currency: "USD", created_at: Time.zone.local(2026, 10, 18), is_guest: true)
    order.order_items.build(product: @product, quantity: 1, unit_price: 2762, line_total: 2762)

    body = html_of(OrderMailer.confirmation(order))

    assert_includes body, "Thank you, Layla."
    assert_includes body, "$2,797"
    assert_includes body, "Checked out as a guest?"
    assert_not_includes body, "$ 2,797.00"
  end

  test "price drop email states the new price plainly, in Arabic right to left" do
    item = WishlistItem.new(user: @user, product: @product, price_when_added: 3000)

    I18n.with_locale(:ar) do
      body = html_of(WishlistMailer.price_drop(item))

      assert_includes body, 'dir="rtl"'
      assert_includes body, "$2,762"
      assert_not_includes body, "%%"
    end
  end

  private

  def html_of(mail)
    (mail.html_part || mail).body.decoded
  end
end
