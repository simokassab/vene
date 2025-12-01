class Admin::DashboardController < Admin::BaseController
  def index
    @products_count = Product.count
    @orders_count = Order.count
    @recent_orders = Order.order(created_at: :desc).limit(5)
  end
end
