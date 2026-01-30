class Storefront::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: %i[update destroy set_default]

  def create
    @address = current_user.addresses.build(address_params)
    @address.is_default = true if current_user.addresses.none?

    if @address.save
      redirect_to orders_path(locale: I18n.locale, tab: "addresses"), notice: t("addresses.created", default: "Address saved")
    else
      redirect_to orders_path(locale: I18n.locale, tab: "addresses"), alert: @address.errors.full_messages.join(", ")
    end
  end

  def update
    if @address.update(address_params)
      redirect_to orders_path(locale: I18n.locale, tab: "addresses"), notice: t("addresses.updated", default: "Address updated")
    else
      redirect_to orders_path(locale: I18n.locale, tab: "addresses"), alert: @address.errors.full_messages.join(", ")
    end
  end

  def destroy
    @address.destroy
    redirect_to orders_path(locale: I18n.locale, tab: "addresses"), notice: t("addresses.deleted", default: "Address removed")
  end

  def set_default
    current_user.addresses.update_all(is_default: false)
    @address.update!(is_default: true)
    redirect_to orders_path(locale: I18n.locale, tab: "addresses"), notice: t("addresses.set_default", default: "Default address updated")
  end

  private

  def set_address
    @address = current_user.addresses.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:label, :name, :phone, :country, :city, :postal_code, :street_address, :building, :is_default)
  end
end
