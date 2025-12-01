class Storefront::CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.new(session)
    @order = Order.new(name: current_user.name, email: current_user.email, phone: current_user.phone,
                       country: current_user.default_country, city: current_user.default_city, address: current_user.default_address)
  end

  def create
    @cart = Cart.new(session)
    return redirect_to cart_path(locale: I18n.locale), alert: t("cart.empty") if @cart.items.empty?

    @order = current_user.orders.new(order_params)
    @order.tax_type = order_params[:country] == current_settings.local_country ? "local" : "international"
    @order.status = "payment_pending"

    ActiveRecord::Base.transaction do
      @cart.items.each do |item|
        @order.order_items.build(
          product: item.product,
          product_variant: item.product_variant,
          quantity: item.quantity,
          unit_price: item.unit_price
        )
      end
      @order.save!
      @order.update_totals!(current_settings)
      OrderConfirmationJob.perform_later(@order.id)
      session[:cart] = {}
    end

    result = Montypay::Client.new(@order).start_payment
    if result.success?
      redirect_to storefront_payments_success_path(locale: I18n.locale, order_id: @order.id)
    else
      redirect_to storefront_payments_failure_path(locale: I18n.locale, order_id: @order.id)
    end
  rescue ActiveRecord::RecordInvalid
    render :show, status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :country, :city, :address)
  end
end
