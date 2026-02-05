class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: %i[show edit update destroy update_status update_payment_status create_shipment tracking invoice]

  def index
    @orders = Order.includes(:user, order_items: :product).order(created_at: :desc)
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
    if params[:payment_status] == "paid" && @order.payment_status != "paid"
      @order.confirm_payment!
    else
      @order.update(payment_status: params[:payment_status])
    end
    redirect_to admin_order_path(@order, locale: I18n.locale), notice: t("admin.orders.payment_updated")
  end

  def create_shipment
    if @order.dhl_tracking_id.present?
      redirect_to admin_order_path(@order, locale: I18n.locale), alert: t("admin.orders.shipment_already_exists", default: "Shipment already exists for this order.")
      return
    end

    shipment = @order.create_dhl_shipment
    if shipment.success?
      redirect_to admin_order_path(@order, locale: I18n.locale), notice: t("admin.orders.shipment_created", default: "DHL shipment created. Tracking: %{tracking}") % { tracking: shipment.tracking_number }
    else
      redirect_to admin_order_path(@order, locale: I18n.locale), alert: t("admin.orders.shipment_failed", default: "Failed to create DHL shipment.")
    end
  rescue Dhl::Client::Error => e
    redirect_to admin_order_path(@order, locale: I18n.locale), alert: t("admin.orders.shipment_error", default: "DHL Error: %{error}") % { error: e.message }
  end

  def tracking
    @tracking_info = @order.dhl_tracking_info
  end

  def invoice
    pdf = InvoiceGenerator.new(@order).render
    send_data pdf, filename: "order-#{@order.id}.pdf", type: "application/pdf", disposition: :inline
  end

  private

  def set_order
    @order = Order.includes(order_items: { product: [:sub_category, :product_images], product_variant: [] }).find(params[:id])
  end

  def order_params
    params.require(:order).permit(:dhl_tracking_id, :status, :payment_status)
  end
end
