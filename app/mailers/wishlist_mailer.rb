class WishlistMailer < ApplicationMailer
  default from: "no-reply@venejewelry.com"

  def back_in_stock(wishlist_item)
    @wishlist_item = wishlist_item
    @user = wishlist_item.user
    @product = wishlist_item.product
    @variant = wishlist_item.product_variant

    mail(
      to: @user.email,
      subject: I18n.t("mailers.wishlist_mailer.back_in_stock.subject", product: @product.name(@user_locale))
    )
  end

  def price_drop(wishlist_item)
    @wishlist_item = wishlist_item
    @user = wishlist_item.user
    @product = wishlist_item.product
    @variant = wishlist_item.product_variant
    @original_price = wishlist_item.price_when_added
    @current_price = wishlist_item.current_price
    @percentage = wishlist_item.price_drop_percentage

    mail(
      to: @user.email,
      subject: I18n.t("mailers.wishlist_mailer.price_drop.subject", product: @product.name(@user_locale), percentage: @percentage)
    )
  end

  private

  def user_locale
    @user_locale ||= :en
  end
end
