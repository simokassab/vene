class Storefront::GuestRegistrationsController < ApplicationController
  before_action :redirect_if_signed_in
  before_action :set_order

  def new
    @user = User.new(
      email: @order.email,
      name: @order.name,
      phone: @order.phone
    )
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Link order to new user
      @order.update!(user: @user, is_guest: false)

      # Create address from order
      @user.addresses.create!(
        name: @order.name,
        phone: @order.phone,
        country: @order.country,
        country_code: @order.country_code,
        city: @order.city,
        postal_code: @order.postal_code,
        street_address: @order.street_address,
        building: @order.building,
        is_default: true
      )

      sign_in(@user)
      session.delete(:pending_order_id)
      redirect_to order_path(@order, locale: I18n.locale), notice: t("guest_checkout.account_created", default: "Account created successfully! Your order has been linked to your new account.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_signed_in
    redirect_to orders_path(locale: I18n.locale) if user_signed_in?
  end

  def set_order
    @order = Order.find_by(id: session[:pending_order_id], is_guest: true)
    unless @order
      redirect_to root_path(locale: I18n.locale), alert: t("guest_checkout.no_order", default: "No guest order found to link to your account.")
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :phone, :password, :password_confirmation)
  end
end
