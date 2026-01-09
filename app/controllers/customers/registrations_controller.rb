class Customers::RegistrationsController < Devise::RegistrationsController
  layout "application"

  before_action :set_settings

  helper_method :current_settings

  private

  def set_settings
    @settings = Setting.current
  end

  def current_settings
    @settings || Setting.current
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :default_country, :default_city, :default_address)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :current_password, :default_country, :default_city, :default_address)
  end

  def after_sign_up_path_for(resource)
    root_path(locale: I18n.locale)
  end

  def after_update_path_for(resource)
    root_path(locale: I18n.locale)
  end
end
