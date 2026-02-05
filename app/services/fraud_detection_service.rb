# frozen_string_literal: true

class FraudDetectionService
  # Risk score thresholds
  RISK_LOW = 30
  RISK_MEDIUM = 60
  RISK_HIGH = 80

  # Velocity limits
  VELOCITY_LIMITS = {
    orders_per_user_1h: 3,
    orders_per_ip_1h: 5,
    orders_per_user_24h: 10,
    failed_payments_user_1h: 3,
    failed_payments_ip_1h: 5
  }.freeze

  # Risk weights for different signals
  RISK_WEIGHTS = {
    high_order_velocity_user: 25,
    high_order_velocity_ip: 20,
    daily_order_limit_exceeded: 15,
    high_failed_payments_user: 30,
    high_failed_payments_ip: 25,
    mismatched_geo: 10,
    first_order_high_value: 10
  }.freeze

  Result = Data.define(:allowed, :risk_score, :risk_level, :reasons)

  # @param user [User, nil] The user placing the order (nil for guest checkout)
  def initialize(user:, ip_address:, user_agent: nil, order_total: 0)
    @user = user  # Can be nil for guests
    @ip_address = ip_address
    @user_agent = user_agent
    @order_total = order_total
    @risk_score = 0
    @reasons = []
  end

  # Analyze the order for fraud indicators
  # @return [Result] Analysis result with risk score and recommendation
  def analyze
    check_order_velocity_user
    check_order_velocity_ip
    check_daily_order_limit
    check_failed_payments_user
    check_failed_payments_ip
    check_first_order_high_value

    risk_level = calculate_risk_level
    allowed = @risk_score < RISK_HIGH

    log_analysis(risk_level, allowed)

    Result.new(
      allowed: allowed,
      risk_score: @risk_score,
      risk_level: risk_level,
      reasons: @reasons
    )
  end

  # Class method for quick check
  # @return [Result]
  def self.analyze(user:, ip_address:, user_agent: nil, order_total: 0)
    new(user: user, ip_address: ip_address, user_agent: user_agent, order_total: order_total).analyze
  end

  private

  def check_order_velocity_user
    return if @user.nil?  # Skip for guests

    count = recent_orders_by_user(1.hour)
    if count >= VELOCITY_LIMITS[:orders_per_user_1h]
      add_risk(:high_order_velocity_user, "#{count} orders by user in last hour")
    end
  end

  def check_order_velocity_ip
    count = recent_orders_by_ip(1.hour)
    if count >= VELOCITY_LIMITS[:orders_per_ip_1h]
      add_risk(:high_order_velocity_ip, "#{count} orders from IP #{@ip_address} in last hour")
    end
  end

  def check_daily_order_limit
    return if @user.nil?  # Skip for guests

    count = recent_orders_by_user(24.hours)
    if count >= VELOCITY_LIMITS[:orders_per_user_24h]
      add_risk(:daily_order_limit_exceeded, "#{count} orders by user in last 24 hours")
    end
  end

  def check_failed_payments_user
    return if @user.nil?  # Skip for guests

    count = failed_payments_by_user(1.hour)
    if count >= VELOCITY_LIMITS[:failed_payments_user_1h]
      add_risk(:high_failed_payments_user, "#{count} failed payments by user in last hour")
    end
  end

  def check_failed_payments_ip
    count = failed_payments_by_ip(1.hour)
    if count >= VELOCITY_LIMITS[:failed_payments_ip_1h]
      add_risk(:high_failed_payments_ip, "#{count} failed payments from IP in last hour")
    end
  end

  def check_first_order_high_value
    return unless first_order?
    return unless @order_total > 500 # $500 threshold for high-value first order

    add_risk(:first_order_high_value, "First order with high value: $#{@order_total}")
  end

  def recent_orders_by_user(period)
    return 0 if @user.nil?

    @user.orders
      .where(created_at: period.ago..)
      .where.not(status: "canceled")
      .count
  end

  def recent_orders_by_ip(period)
    return 0 if @ip_address.blank?

    Order.where(ip_address: @ip_address)
      .where(created_at: period.ago..)
      .where.not(status: "canceled")
      .count
  end

  def failed_payments_by_user(period)
    return 0 if @user.nil?

    @user.orders
      .where(payment_status: "failed")
      .where(created_at: period.ago..)
      .count
  end

  def failed_payments_by_ip(period)
    return 0 if @ip_address.blank?

    Order.where(ip_address: @ip_address)
      .where(payment_status: "failed")
      .where(created_at: period.ago..)
      .count
  end

  def first_order?
    return true if @user.nil?  # Guests are always "first order"

    @user.orders.where.not(status: "canceled").count.zero?
  end

  def add_risk(signal, reason)
    weight = RISK_WEIGHTS[signal] || 0
    @risk_score += weight
    @reasons << { signal: signal, reason: reason, weight: weight }
  end

  def calculate_risk_level
    case @risk_score
    when 0...RISK_LOW then :low
    when RISK_LOW...RISK_MEDIUM then :medium
    when RISK_MEDIUM...RISK_HIGH then :high
    else :blocked
    end
  end

  def log_analysis(risk_level, allowed)
    log_data = {
      user_id: @user&.id,  # Safe navigation for nil
      ip_address: @ip_address,
      order_total: @order_total,
      risk_score: @risk_score,
      risk_level: risk_level,
      allowed: allowed,
      reasons: @reasons
    }

    if risk_level == :blocked
      Rails.logger.warn("[FraudDetection] BLOCKED: #{log_data.to_json}")
    elsif risk_level == :high
      Rails.logger.warn("[FraudDetection] HIGH RISK: #{log_data.to_json}")
    elsif risk_level == :medium
      Rails.logger.info("[FraudDetection] MEDIUM RISK: #{log_data.to_json}")
    end
  end
end
