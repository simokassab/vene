class Customers::RegistrationsController < Devise::RegistrationsController
  layout "application"

  private

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
