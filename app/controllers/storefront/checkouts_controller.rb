class Storefront::CheckoutsController < ApplicationController
  before_action :ensure_cart_not_empty, only: [:show, :review, :create]

  def show
    @cart = Cart.new(session)
    @no_postal_countries = countries_without_postal_codes
    @is_guest = !user_signed_in?

    if user_signed_in?
      @addresses = current_user.addresses.order(is_default: :desc, updated_at: :desc)
      default_addr = current_user.default_address_record

      if default_addr
        @order = Order.new(
          name: default_addr.name,
          email: current_user.email,
          phone: default_addr.phone,
          country: default_addr.country,
          country_code: default_addr.country_code,
          city: default_addr.city,
          postal_code: default_addr.postal_code,
          street_address: default_addr.street_address,
          building: default_addr.building
        )
      else
        @order = Order.new(
          name: current_user.name,
          email: current_user.email,
          phone: current_user.phone,
          country: current_user.default_country,
          city: current_user.default_city,
          street_address: current_user.default_address
        )
      end
    else
      # Guest checkout - empty form
      @addresses = []
      @order = Order.new
    end
  end

  def review
    @cart = Cart.new(session)
    return redirect_to cart_path(locale: I18n.locale), alert: t("cart.empty") if @cart.items.empty?

    @is_guest = !user_signed_in?

    if user_signed_in? && params[:address_id].present?
      # User selected a saved address
      address = current_user.addresses.find(params[:address_id])
      @order = Order.new(
        name: address.name,
        email: params.dig(:order, :email) || current_user.email,
        phone: address.phone,
        country: address.country,
        country_code: address.country_code,
        city: address.city,
        postal_code: address.postal_code,
        street_address: address.street_address,
        building: address.building,
        address_id: address.id
      )
    else
      # New address entered (both guest and authenticated)
      @order = Order.new(order_params)
      @order.country_code = Dhl::Address.country_code_for(@order.country) if @order.country.present? && @order.country_code.blank?

      # Save address if requested (only for authenticated users)
      if user_signed_in? && params[:save_address] == "1" && @order.street_address.present?
        addr = current_user.addresses.build(
          label: params[:address_label],
          name: @order.name,
          phone: @order.phone,
          country: @order.country,
          country_code: @order.country_code,
          city: @order.city,
          postal_code: @order.postal_code,
          street_address: @order.street_address,
          building: @order.building,
          is_default: current_user.addresses.none?
        )
        addr.save
        @order.address_id = addr.id if addr.persisted?
      end
    end

    # Validate required fields
    required_fields = %i[name email phone country city street_address]
    missing = required_fields.select { |f| @order.send(f).blank? }
    if missing.any?
      missing.each { |f| @order.errors.add(f, :blank) }
      @addresses = user_signed_in? ? current_user.addresses.order(is_default: :desc, updated_at: :desc) : []
      @no_postal_countries = countries_without_postal_codes
      render :show, status: :unprocessable_entity
      return
    end

    # Validate city against DHL (safety net - front-end already validates)
    begin
      dest_code = @order.country_code.presence || Dhl::Address.country_code_for(@order.country)
      cache_key = "dhl_city/#{dest_code}/#{@order.city.downcase.strip}"
      city_result = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
        Dhl.client.address_validate.validate(country_code: dest_code, city_name: @order.city)
      end

      if city_result[:valid]
        # Auto-fill postal code if user left it blank
        if @order.postal_code.blank? && city_result[:postal_code].present?
          @order.postal_code = city_result[:postal_code]
        end
      else
        @order.errors.add(:city, "is not recognized by DHL shipping. Please check the spelling.")
        @addresses = user_signed_in? ? current_user.addresses.order(is_default: :desc, updated_at: :desc) : []
        @no_postal_countries = countries_without_postal_codes
        render :show, status: :unprocessable_entity
        return
      end
    rescue Dhl::Client::Error => e
      Rails.logger.warn("DHL city validation unavailable: #{e.message}")
      # Don't block checkout - rate fetch will catch issues
    end

    # Store checkout params in session for the create step
    session[:checkout_params] = {
      name: @order.name,
      email: @order.email,
      phone: @order.phone,
      country: @order.country,
      country_code: @order.country_code,
      city: @order.city,
      postal_code: @order.postal_code,
      street_address: @order.street_address,
      building: @order.building,
      address_id: @order.address_id
    }

    # Calculate DHL shipping rate (free shipping for product 157)
    if @cart.items.all? { |item| item.product.id == 157 }
      @shipping_rate = { amount: 0, estimated: false }
    else
      @shipping_rate = fetch_dhl_shipping_rate(@order, @cart)
    end
    @shipping_estimated = @shipping_rate[:estimated]
    @shipping_amount = @shipping_rate[:amount]

    # Store shipping rate in session
    session[:dhl_shipping_rate] = @shipping_amount.to_s
    session[:dhl_shipping_estimated] = @shipping_estimated
  end

  def validate_city
    country_name = params[:country]
    city_name = params[:city]

    if country_name.blank? || city_name.blank?
      return render json: { valid: false, error: "Country and city required" }, status: :unprocessable_entity
    end

    country_code = Dhl::Address.country_code_for(country_name)
    cache_key = "dhl_city/#{country_code}/#{city_name.downcase.strip}"

    result = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      Dhl.client.address_validate.validate(country_code: country_code, city_name: city_name)
    end

    render json: {
      valid: result[:valid],
      postal_code: result[:postal_code],
      city_name: result[:city_name],
      suggestions: result[:addresses].map { |a| a["cityName"] }.uniq.first(5)
    }
  rescue StandardError => e
    Rails.logger.error("DHL address validation error: #{e.message}")
    render json: { valid: false, error: "Validation service unavailable" }, status: :service_unavailable
  end

  def create
    @cart = Cart.new(session)
    return redirect_to cart_path(locale: I18n.locale), alert: t("cart.empty") if @cart.items.empty?

    # Fraud detection - works for both guest and authenticated
    fraud_result = FraudDetectionService.analyze(
      user: current_user,  # Will be nil for guests
      ip_address: request.remote_ip,
      user_agent: request.user_agent,
      order_total: @cart.subtotal
    )

    unless fraud_result.allowed
      user_info = user_signed_in? ? "user_id=#{current_user.id}" : "guest_email=#{session[:checkout_params]&.dig('email')}"
      Rails.logger.warn("[Checkout] Blocked by fraud detection: #{user_info} score=#{fraud_result.risk_score}")
      return redirect_to cart_path(locale: I18n.locale),
                        alert: t("checkout.order_blocked", default: "Unable to process order. Please contact support.")
    end

    # Reuse existing pending order to prevent duplicates on retry/back-button
    if session[:pending_order_id].present?
      existing = Order.find_by(id: session[:pending_order_id], status: "payment_pending")
      if existing
        result = Montypay::Client.new(existing).start_payment
        if result.success?
          return redirect_to result.redirect_url, allow_other_host: true
        else
          existing.update(payment_status: "failed")
          session.delete(:pending_order_id)
          return redirect_to order_path(existing, locale: I18n.locale),
                            alert: t("payments.initialization_failed", error: result.error)
        end
      else
        session.delete(:pending_order_id)
      end
    end

    # Read params from session (set during review step) or fall back to direct params
    saved_params = session[:checkout_params]
    permitted_keys = %i[name email phone country country_code city postal_code street_address building address_id]
    current_order_params = if saved_params.present?
      ActionController::Parameters.new(saved_params).permit(*permitted_keys)
    else
      order_params
    end

    # Build order - either for user or as guest
    if user_signed_in?
      @order = current_user.orders.new(current_order_params)
    else
      @order = Order.new(current_order_params)
      @order.is_guest = true
    end

    @order.status = "payment_pending"
    @order.ip_address = request.remote_ip
    @order.user_agent = request.user_agent&.truncate(500)

    # Set currency and exchange rate from visitor session
    @order.currency = visitor_currency
    rate = ExchangeRateService.rate_for(visitor_currency)
    @order.exchange_rate = rate

    # Read shipping rate from session (set during review step) — DHL returns USD
    precision = ExchangeRateService.three_decimal?(visitor_currency) ? 3 : 2
    shipping_usd = session[:dhl_shipping_rate].present? ? BigDecimal(session[:dhl_shipping_rate]) : nil
    # Always convert shipping to order currency (DHL rate or flat rate fallback)
    if shipping_usd
      shipping_override = (shipping_usd * rate).round(precision)
    else
      flat_rate = current_settings.shipping_flat_rate || 0
      shipping_override = (flat_rate * rate).round(precision)
    end

    ActiveRecord::Base.transaction do
      @cart.items.each do |item|
        converted_price = (item.unit_price * rate).round(precision)
        @order.order_items.build(
          product: item.product,
          product_variant: item.product_variant,
          quantity: item.quantity,
          unit_price: converted_price
        )
      end

      @order.save!
      @order.update_totals!(current_settings, shipping_override: shipping_override)

      # Handle coupon if applied (after order is saved)
      if @cart.has_coupon?
        coupon = @cart.coupon
        if coupon
          # Re-validate coupon (security: don't trust session)
          validation = coupon.valid_for_use?(user: current_user, subtotal: @order.subtotal)
          if validation[:valid]
            discount = coupon.calculate_discount(@order.subtotal)
            # For fixed amount coupons, convert the discount to the order's currency
            if coupon.discount_type == "fixed" && rate != 1.0
              converted_fixed = (coupon.discount_value * rate).round(precision)
              discount = [converted_fixed, @order.subtotal].min
            end
            @order.update!(
              coupon: coupon,
              coupon_code: coupon.code,
              discount_amount: discount
            )
            # Recalculate total with discount
            @order.update!(total_amount: @order.subtotal - discount + @order.shipping_amount)

            # Only create UserCoupon for authenticated users
            if user_signed_in?
              UserCoupon.create!(user: current_user, coupon: coupon, order: @order)
            end
            coupon.increment_usage!
          else
            # Coupon is no longer valid, remove from session
            @cart.remove_coupon
          end
        else
          # Coupon was deleted, remove from session
          @cart.remove_coupon
        end
      end

      # Store order ID in session so we can clear cart after payment
      session[:pending_order_id] = @order.id
    end

    # Clean up checkout session data
    session.delete(:checkout_params)
    session.delete(:dhl_shipping_rate)
    session.delete(:dhl_shipping_estimated)

    result = Montypay::Client.new(@order).start_payment

    if result.success?
      # Redirect to MontyPay hosted checkout
      redirect_to result.redirect_url, allow_other_host: true
    else
      # Payment initiation failed - show error
      @order.update(payment_status: "failed")
      redirect_to order_path(@order, locale: I18n.locale),
                  alert: t("payments.initialization_failed", error: result.error)
    end
  rescue ActiveRecord::RecordInvalid
    render :show, status: :unprocessable_entity
  end

  private

  def ensure_cart_not_empty
    cart = Cart.new(session)
    if cart.items.empty?
      redirect_to cart_path(locale: I18n.locale), alert: t("cart.empty")
    end
  end

  def order_params
    params.require(:order).permit(:name, :email, :phone, :country, :country_code, :city, :postal_code, :street_address, :building, :address_id)
  end

  def countries_without_postal_codes
    ISO3166::Country.all.reject(&:postal_code).map { |c| c.translations["en"] || c.common_name }.compact.sort
  end

  def fetch_dhl_shipping_rate(order, cart)
    shipper_address = Dhl.default_shipper_address
    account_number = ENV["DHL_EXPRESS_ACCOUNT_NUMBER"]

    if shipper_address.nil? || account_number.blank?
      Rails.logger.warn("DHL shipping rate: missing shipper configuration, using flat rate")
      return { amount: current_settings.shipping_flat_rate || 0, estimated: true }
    end

    # Estimate 0.5 KG per item, minimum 0.5
    total_weight = [cart.total_items_quantity * 0.5, 0.5].max

    dest_country_code = order.country_code.presence || Dhl::Address.country_code_for(order.country)

    # Build GET /rates query parameters per DHL Express API
    rate_params = {
      accountNumber: account_number,
      originCountryCode: shipper_address.country_code,
      originCityName: shipper_address.city_name,
      originPostalCode: shipper_address.postal_code,
      destinationCountryCode: dest_country_code,
      destinationCityName: order.city,
      weight: total_weight,
      length: 20,
      width: 15,
      height: 10,
      plannedShippingDate: Date.current.strftime("%Y-%m-%d"),
      isCustomsDeclarable: shipper_address.country_code != dest_country_code,
      unitOfMeasurement: "metric"
    }

    # Use "00000" for countries without postal codes, otherwise use user-provided value
    rate_params[:destinationPostalCode] = order.postal_code.presence || "00000"

    client = Dhl.client
    products = client.shipments.get_rates(rate_params)

    # Find EXPRESS WORLDWIDE (product code "P")
    express_product = products.find { |p| p["productCode"] == "P" }
    if express_product && express_product["totalPrice"]
      price = express_product["totalPrice"].first
      amount = BigDecimal(price["price"].to_s)
      { amount: amount, estimated: false }
    elsif products.any?
      # Fall back to first available product
      price = products.first["totalPrice"]&.first
      amount = price ? BigDecimal(price["price"].to_s) : (current_settings.shipping_flat_rate || 0)
      { amount: amount, estimated: price.nil? }
    else
      Rails.logger.warn("DHL shipping rate: no products returned, using flat rate")
      { amount: current_settings.shipping_flat_rate || 0, estimated: true }
    end
  rescue StandardError => e
    Rails.logger.error("DHL shipping rate error: #{e.message}")
    { amount: current_settings.shipping_flat_rate || 0, estimated: true }
  end
end
