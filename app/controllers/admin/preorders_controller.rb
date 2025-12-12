class Admin::PreordersController < Admin::BaseController
  def index
    @q = OrderItem.includes(:order, :product, :product_variant)
                  .preorders
                  .ransack(params[:q])
    @pagy, @preorder_items = pagy(@q.result.order(created_at: :desc), items: 50)
  end
end
