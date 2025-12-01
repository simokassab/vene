class Storefront::PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :webhook

  def success
    @order = current_user.orders.find(params[:order_id]) if user_signed_in?
    @order ||= Order.find(params[:order_id])
    @order.update(payment_status: "paid", paid_at: Time.current, status: "paid")
    redirect_to order_path(@order, locale: I18n.locale), notice: t("payments.success")
  end

  def failure
    @order = Order.find(params[:order_id])
    @order.update(payment_status: "failed")
    redirect_to order_path(@order, locale: I18n.locale), alert: t("payments.failure")
  end

  def webhook
    head :ok
  end
end
