class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: %i[show edit update destroy update_status update_payment_status]

  def index
    @orders = Order.order(created_at: :desc)
    @orders = @orders.where(status: params[:status]) if params[:status].present?
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order, locale: I18n.locale), notice: t("admin.orders.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_path(locale: I18n.locale), notice: t("admin.orders.deleted")
  end

  def update_status
    old_status = @order.status

    if params[:status] == "canceled" && old_status != "canceled"
      # Use the cancel_order! method which restores stock
      if @order.cancel_order!
        redirect_to admin_order_path(@order, locale: I18n.locale), notice: t("admin.orders.order_canceled")
      else
        redirect_to admin_order_path(@order, locale: I18n.locale), alert: t("admin.orders.cancel_failed")
      end
    else
      @order.update(status: params[:status])
      redirect_to admin_order_path(@order, locale: I18n.locale), notice: t("admin.orders.status_updated")
    end
  end

  def update_payment_status
    @order.update(payment_status: params[:payment_status])
    redirect_to admin_order_path(@order, locale: I18n.locale), notice: t("admin.orders.payment_updated")
  end

  def invoice
    pdf = InvoiceGenerator.new(@order).render
    send_data pdf, filename: "order-#{@order.id}.pdf", type: "application/pdf", disposition: :inline
  end

  private

  def set_order
    @order = Order.includes(order_items: { product: [:category, :product_images], product_variant: [] }).find(params[:id])
  end

  def order_params
    params.require(:order).permit(:dhl_tracking_id, :status, :payment_status)
  end
end
