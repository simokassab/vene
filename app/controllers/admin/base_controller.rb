class Admin::BaseController < ApplicationController
  include Pagy::Backend

  layout "admin"
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    if user_signed_in? && current_user.admin?
      return
    elsif admin_user_signed_in? && current_admin_user.admin?
      return
    elsif user_signed_in? || admin_user_signed_in?
      redirect_to root_path(locale: I18n.locale), alert: t("errors.not_authorized")
    else
      redirect_to new_admin_user_session_path(locale: I18n.locale), alert: t("errors.not_authorized")
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_user_session_path(locale: I18n.locale)
  end

  def after_sign_in_path_for(resource)
    admin_root_path(locale: I18n.locale)
  end
end
