class Admin::WebhooksController < Admin::BaseController
  def index
    @pagy, @webhooks = pagy(
      ProcessedWebhook.order(created_at: :desc),
      items: 25
    )
  end

  def show
    @webhook = ProcessedWebhook.find(params[:id])
    @order = Order.find_by(id: @webhook.order_id) if @webhook.order_id.present?
  end
end
