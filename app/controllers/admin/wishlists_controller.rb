class Admin::WishlistsController < Admin::BaseController
  def index
    @q = WishlistItem.includes(:user, product: [:product_images, :sub_category])
                     .includes(product_variant: ProductVariant::DISPLAY_INCLUDES)
                     .ransack(params[:q])
    @pagy, @wishlist_items = pagy(@q.result.order(created_at: :desc), items: 25)
  end
end
