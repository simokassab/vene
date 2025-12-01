class Admin::BaseController < ApplicationController
  include Pagy::Backend

  layout "admin"
  before_action :authenticate_user!
  before_action :ensure_admin!

  private

  def ensure_admin!
    return if current_user&.admin?

    redirect_to new_admin_session_path(locale: I18n.locale), alert: t("errors.not_authorized")
  end
end
