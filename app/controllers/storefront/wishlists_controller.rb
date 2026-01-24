class Storefront::WishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wishlist_item, only: [:destroy]

  def index
    @wishlist_items = current_user.wishlist_items
                                  .includes(product: [:product_images, :sub_category])
                                  .includes(:product_variant)
                                  .order(created_at: :desc)
  end

  def create
    product = Product.find(params[:product_id])
    variant = params[:product_variant_id].present? ? ProductVariant.find(params[:product_variant_id]) : nil

    @wishlist_item = current_user.wishlist_items.new(
      product: product,
      product_variant: variant
    )

    if @wishlist_item.save
      redirect_back fallback_location: product_path(product.slug, locale: I18n.locale), notice: t("wishlist.added")
    else
      redirect_back fallback_location: product_path(product.slug, locale: I18n.locale), alert: @wishlist_item.errors.full_messages.first
    end
  end

  def destroy
    @wishlist_item.destroy
    redirect_back fallback_location: wishlist_items_path(locale: I18n.locale), notice: t("wishlist.removed")
  end

  private

  def set_wishlist_item
    @wishlist_item = current_user.wishlist_items.find(params[:id])
  end
end
