class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_locale, :set_settings, :check_maintenance_mode

  helper_method :current_settings, :cart_item_count

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale].presence || session[:locale].presence || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def set_settings
    @settings = Setting.current
  end

  def current_settings
    @settings || Setting.current
  end

  def cart_item_count
    @cart_item_count ||= Cart.new(session).items.sum(&:quantity)
  end

  def check_maintenance_mode
    # Skip for all admin controllers (including Devise admin controllers)
    return if self.class.name.start_with?("Admin::")

    # Skip if maintenance mode is off
    return unless current_settings.maintenance_mode

    # Allow access for admin users (check both devise scopes)
    admin_logged_in = false

    if respond_to?(:current_user) && user_signed_in?
      admin_logged_in = current_user.admin?
    elsif respond_to?(:current_admin_user) && admin_user_signed_in?
      admin_logged_in = current_admin_user.admin?
    end

    return if admin_logged_in

    # Show maintenance page for non-admin users
    render "shared/maintenance", layout: "maintenance", status: :service_unavailable
  end
end
