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

      # Handle coupon if applied (after order is saved)
      if @cart.has_coupon?
        coupon = @cart.coupon
        if coupon
          # Re-validate coupon (security: don't trust session)
          validation = coupon.valid_for_use?(user: current_user, subtotal: @order.subtotal)
          if validation[:valid]
            discount = coupon.calculate_discount(@order.subtotal)
            @order.update!(
              coupon: coupon,
              coupon_code: coupon.code,
              discount_amount: discount
            )
            # Recalculate total with discount
            @order.update!(total_amount: @order.subtotal - discount + @order.shipping_amount)

            # Create user coupon record and increment usage
            UserCoupon.create!(user: current_user, coupon: coupon, order: @order)
            coupon.increment_usage!
          else
            # Coupon is no longer valid, remove from session
            @cart.remove_coupon
          end
        else
          # Coupon was deleted, remove from session
          @cart.remove_coupon
        end
      end

      OrderConfirmationJob.perform_later(@order.id)
      session[:cart] = {}
      @cart.remove_coupon # Clear coupon from session
    end

    result = Montypay::Client.new(@order).start_payment

    if result.success?
      # Redirect to MontyPay hosted checkout
      redirect_to result.redirect_url, allow_other_host: true
    else
      # Payment initiation failed - show error
      @order.update(payment_status: "failed")
      redirect_to order_path(@order, locale: I18n.locale),
                  alert: t("payments.initialization_failed", error: result.error)
    end
  rescue ActiveRecord::RecordInvalid
    render :show, status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :country, :city, :address)
  end
end
