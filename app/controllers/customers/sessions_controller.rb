class Customers::SessionsController < Devise::SessionsController
  layout "application"

  def after_sign_in_path_for(_resource)
    root_path(locale: I18n.locale)
  end
end
