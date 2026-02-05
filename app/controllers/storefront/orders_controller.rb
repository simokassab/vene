class Storefront::OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :invoice, :cancel]
  before_action :set_order, only: %i[show invoice cancel]

  def index
    @orders = current_user.orders.includes(order_items: { product: :product_images, product_variant: [] }).order(created_at: :desc)
    @addresses = current_user.addresses.order(is_default: :desc, updated_at: :desc)
  end

  def show; end

  def invoice
    pdf = InvoiceGenerator.new(@order).render
    send_data pdf, filename: "order-#{@order.id}.pdf", type: "application/pdf", disposition: :inline
  end

  def cancel
    fallback = user_signed_in? ? orders_path(locale: I18n.locale) : root_path(locale: I18n.locale)

    if @order.status == "pending" || @order.status == "payment_pending"
      if @order.cancel_order!
        # Clear session for guest orders
        session.delete(:pending_order_id) if @order.is_guest?
        redirect_back fallback_location: fallback, notice: t("orders.canceled", default: "Order canceled")
      else
        redirect_back fallback_location: fallback, alert: t("orders.cancel_failed", default: "Failed to cancel order")
      end
    else
      redirect_back fallback_location: fallback, alert: t("orders.cannot_cancel", default: "This order can no longer be canceled")
    end
  end

  private

  def set_order
    if user_signed_in?
      # Authenticated users can only see their own orders
      @order = current_user.orders.includes(order_items: { product: :product_images, product_variant: [] }).find(params[:id])
    else
      # Guests can only see their pending order from session
      if session[:pending_order_id].to_s == params[:id]
        @order = Order.includes(order_items: { product: :product_images, product_variant: [] }).find_by(id: params[:id])
        unless @order
          redirect_to root_path(locale: I18n.locale), alert: t("orders.not_found", default: "Order not found")
        end
      else
        redirect_to root_path(locale: I18n.locale), alert: t("orders.not_found", default: "Order not found")
      end
    end
  end
end
