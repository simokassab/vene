class Storefront::PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :webhook

  def success
    @order = find_order_for_redirect

    # Confirm payment if webhook hasn't already (decrements stock + marks paid)
    if @order.payment_status == "pending"
      @order.confirm_payment!
      OrderConfirmationJob.perform_later(@order.id)
    end

    # Clear cart and coupon now that payment is confirmed
    clear_cart_and_session

    redirect_to order_path(@order, locale: I18n.locale), notice: t("payments.success")
  end

  def failure
    @order = Order.find(params[:order_id])
    # Only update if still pending (webhook may have already updated)
    @order.update(payment_status: "failed") if @order.payment_status == "pending"
    # Don't clear cart — user may want to try again
    redirect_to order_path(@order, locale: I18n.locale), alert: t("payments.failure")
  end

  def webhook
    verifier = Montypay::WebhookVerifier.new(webhook_params)

    unless verifier.valid?
      Rails.logger.warn("MontyPay webhook signature invalid: #{webhook_params.to_h}")
      return head :unauthorized
    end

    # Idempotency check - skip if already processed
    webhook_id = webhook_params[:id]
    if ProcessedWebhook.processed?(webhook_id, webhook_type: "montypay")
      Rails.logger.info("MontyPay webhook already processed: #{webhook_id}")
      return head :ok
    end

    order = Order.find_by(id: webhook_params[:order_number])
    unless order
      Rails.logger.warn("MontyPay webhook: order not found - #{webhook_params[:order_number]}")
      return head :not_found
    end

    # Record webhook before processing (race condition safe)
    recorded = ProcessedWebhook.record!(
      webhook_id,
      webhook_type: "montypay",
      order_id: order.id.to_s,
      payload: webhook_params.to_h
    )

    # If another process beat us to it, skip processing
    unless recorded
      Rails.logger.info("MontyPay webhook concurrently processed: #{webhook_id}")
      return head :ok
    end

    process_webhook(order)
    head :ok
  end

  private

  def find_order_for_redirect
    if user_signed_in?
      current_user.orders.find(params[:order_id])
    else
      Order.find(params[:order_id])
    end
  end

  def webhook_params
    params.permit(
      :id, :order_number, :order_amount, :order_currency, :order_description,
      :order_status, :type, :status, :reason, :card, :hash, :date,
      :customer_name, :customer_email
    )
  end

  def process_webhook(order)
    case webhook_params[:status]
    when "success"
      was_pending = order.payment_status != "paid"
      order.confirm_payment! if was_pending
      order.update!(
        montypay_transaction_id: webhook_params[:id],
        payment_reference: webhook_params[:order_number]
      )
      OrderConfirmationJob.perform_later(order.id) if was_pending
      Rails.logger.info("Order #{order.id} payment successful via webhook")
    when "fail"
      order.update!(
        payment_status: "failed",
        montypay_transaction_id: webhook_params[:id]
      )
      Rails.logger.info("Order #{order.id} payment failed via webhook: #{webhook_params[:reason]}")
    when "waiting"
      Rails.logger.info("Order #{order.id} payment pending via webhook")
    else
      Rails.logger.warn("Order #{order.id} received unknown webhook status: #{webhook_params[:status]}")
    end
  end

  def clear_cart_and_session
    session[:cart] = {}
    session.delete(:coupon_code)
    session.delete(:coupon_id)
    session.delete(:discount_amount)
    session.delete(:pending_order_id)
  end
end
