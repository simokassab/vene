class Storefront::OrdersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_order, only: %i[show invoice cancel]

  def index
    @orders = current_user.orders.includes(order_items: [:product, :product_variant]).order(created_at: :desc)
  end

  def show; end

  def invoice
    pdf = InvoiceGenerator.new(@order).render
    send_data pdf, filename: "order-#{@order.id}.pdf", type: "application/pdf", disposition: :inline
  end

  def cancel
    if @order.status == "pending" || @order.status == "payment_pending"
      @order.update(status: "canceled")
      redirect_back fallback_location: orders_path(locale: I18n.locale), notice: t("orders.canceled", default: "Order canceled")
    else
      redirect_back fallback_location: orders_path(locale: I18n.locale), alert: t("orders.cannot_cancel", default: "This order can no longer be canceled")
    end
  end

  private

  def set_order
    @order = current_user.orders.includes(order_items: [:product, :product_variant]).find(params[:id])
  end
end
