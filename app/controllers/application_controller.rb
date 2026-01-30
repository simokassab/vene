class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_locale, :set_settings, :check_maintenance_mode

  helper_method :current_settings, :cart_item_count, :navigation_categories

  unless Rails.env.production?
    around_action :n_plus_one_detection

    def n_plus_one_detection
      Prosopite.scan
      yield
    ensure
      Prosopite.finish
    end
  end
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

  def navigation_categories
    @navigation_categories ||= Category.active.ordered
                                       .includes(sub_categories: :products)
  end

  def check_maintenance_mode
    # Skip for all admin controllers (including Devise admin controllers)
    return if self.class.name.start_with?("Admin::")

    # Skip if maintenance mode is off
    return unless current_settings.maintenance_mode

    # Only admin-scope sessions bypass maintenance mode
    return if admin_user_signed_in? && current_admin_user.admin?

    # Show maintenance page for non-admin users
    render "shared/maintenance", layout: "maintenance", status: :service_unavailable
  end
end
