class Coupon < ApplicationRecord
  # Associations
  has_many :user_coupons, dependent: :destroy
  has_many :users, through: :user_coupons
  has_many :orders

  # Callbacks
  before_validation :normalize_code

  # Validations
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :discount_type, presence: true, inclusion: { in: %w[percentage fixed] }
  validates :discount_value, presence: true, numericality: { greater_than: 0 }
  validates :usage_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :min_order_amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validate :percentage_not_over_100
  validate :valid_date_range

  # Scopes
  scope :active, -> { where(active: true) }
  scope :valid_now, -> {
    active.where("(valid_from IS NULL OR valid_from <= ?) AND (valid_until IS NULL OR valid_until >= ?)", Date.today, Date.today)
  }
  scope :ordered, -> { order(created_at: :desc) }

  # Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[code discount_type discount_value active valid_from valid_until single_use_per_user usage_limit usage_count min_order_amount created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[orders users user_coupons]
  end

  # Instance Methods
  def calculate_discount(subtotal)
    return BigDecimal("0") if subtotal <= 0

    case discount_type
    when "percentage"
      subtotal * (discount_value / 100)
    when "fixed"
      [discount_value, subtotal].min
    else
      BigDecimal("0")
    end
  end

  def valid_for_use?(user:, subtotal:)
    # Check if coupon is active
    unless active?
      return { valid: false, error: I18n.t("coupons.errors.inactive", default: "This coupon is not active") }
    end

    # Check date range
    if valid_from && Date.today < valid_from
      return { valid: false, error: I18n.t("coupons.errors.not_started", default: "This coupon is not yet valid", date: valid_from) }
    end

    if valid_until && Date.today > valid_until
      return { valid: false, error: I18n.t("coupons.errors.expired", default: "This coupon expired on %{date}", date: valid_until) }
    end

    # Check total usage limit
    if usage_limit.present? && usage_count >= usage_limit
      return { valid: false, error: I18n.t("coupons.errors.usage_limit_reached", default: "This coupon has reached its usage limit") }
    end

    # Check per-user usage
    if single_use_per_user && user && user_coupons.exists?(user_id: user.id)
      return { valid: false, error: I18n.t("coupons.errors.already_used", default: "You have already used this coupon") }
    end

    # Check minimum order amount
    if min_order_amount.present? && subtotal < min_order_amount
      return { valid: false, error: I18n.t("coupons.errors.min_order_not_met", default: "Minimum order of %{amount} required", amount: ActionController::Base.helpers.number_to_currency(min_order_amount)) }
    end

    { valid: true, error: nil }
  end

  def increment_usage!
    increment!(:usage_count)
  end

  def discount_display
    case discount_type
    when "percentage"
      "#{discount_value.to_i}%"
    when "fixed"
      ActionController::Base.helpers.number_to_currency(discount_value)
    else
      ""
    end
  end

  private

  def normalize_code
    self.code = code.to_s.upcase.strip if code.present?
  end

  def percentage_not_over_100
    if discount_type == "percentage" && discount_value.to_f > 100
      errors.add(:discount_value, I18n.t("coupons.errors.percentage_too_high", default: "cannot be greater than 100%"))
    end
  end

  def valid_date_range
    if valid_from.present? && valid_until.present? && valid_until < valid_from
      errors.add(:valid_until, I18n.t("coupons.errors.invalid_date_range", default: "must be after start date"))
    end
  end
end
