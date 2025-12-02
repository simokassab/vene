class Admin::SessionsController < Devise::SessionsController
  layout "admin", except: [:new]

  def create
    super do |resource|
      unless resource.admin?
        sign_out resource
        flash[:alert] = I18n.t("errors.not_authorized")
        redirect_to new_admin_user_session_path(locale: I18n.locale) and return
      end
    end
  end

  def after_sign_in_path_for(_resource)
    admin_root_path(locale: I18n.locale)
  end
end
