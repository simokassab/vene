class Admin::BaseController < ApplicationController
  include Pagy::Backend

  layout "admin"
  before_action :require_admin_access!

  private

  def require_admin_access!
    user = if admin_user_signed_in?
             current_admin_user
           elsif user_signed_in?
             current_user
           end

    unless user
      redirect_to new_admin_user_session_path(locale: I18n.locale), alert: t("errors.not_authorized")
      return
    end

    return if user.admin?

    sign_out(:admin_user) if admin_user_signed_in?
    sign_out(:user) if user_signed_in?
    redirect_to new_admin_user_session_path(locale: I18n.locale), alert: t("errors.not_authorized")
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_user_session_path(locale: I18n.locale)
  end

  def after_sign_in_path_for(resource)
    admin_root_path(locale: I18n.locale)
  end
end
