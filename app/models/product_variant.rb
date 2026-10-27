class ProductVariant < ApplicationRecord
  belongs_to :product
  belongs_to :variant_type, optional: true
  belongs_to :variant_option, optional: true
  has_many :order_items, dependent: :restrict_with_error
  # The combination this variant sells: one option per type (Yellow gold + 52).
  has_many :product_variant_options, dependent: :delete_all, autosave: true, inverse_of: :product_variant
  has_many :variant_options, through: :product_variant_options

  before_validation :assign_option_signature

  # What display_name and primary_image read; preload it wherever lines are listed.
  DISPLAY_INCLUDES = [ :variant_type, :variant_option,
                      { product_variant_options: %i[variant_type variant_option], product: :product_images } ].freeze

  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }

  # For new approach: validate variant_type and variant_option presence
  # For old approach: validate name and value presence
  validate :validate_variant_data
  validate :preorder_date_must_be_future

  scope :active, -> { where(active: true) }
  scope :in_stock, -> { where("stock_quantity > ?", 0) }
  scope :preorder_available, -> { where(allow_preorder: true) }
  scope :purchasable, -> { where("stock_quantity > 0 OR allow_preorder = true") }

  # "Yellow gold · Ring size 52". Colors read on their own; other types carry their name
  # so a bare number is never ambiguous. English for analytics, the locale everywhere else.
  def display_name(locale = I18n.locale)
    parts = combination.map do |pvo|
      type = pvo.variant_type
      label = pvo.variant_option.label(locale)
      type.swatch? ? label : "#{type.localized_name(locale)} #{label}"
    end
    return parts.join(" · ") if parts.any?

    "#{name}: #{value}"
  end

  # Option rows ordered by their type's position. Falls back to the single option on the
  # row itself, so variants created before the backfill read the same way.
  def combination
    rows = product_variant_options.reject(&:marked_for_destruction?)
    if rows.empty? && variant_type && variant_option
      rows = [ ProductVariantOption.new(variant_type: variant_type, variant_option: variant_option) ]
    end
    rows.sort_by { |pvo| [ pvo.variant_type.position, pvo.variant_type.name ] }
  end

  def option_ids
    combination.map(&:variant_option_id)
  end

  # The color option, whose photos this variant shows.
  def image_option
    combination.find { |pvo| pvo.variant_type.drives_images? }&.variant_option
  end

  def image_option_id
    image_option&.id
  end

  def primary_image
    product.images_for(image_option_id).first || product.primary_image
  end

  def in_stock?
    stock_quantity > 0
  end

  # Pre-order methods
  def purchasable?
    stock_quantity > 0 || allow_preorder?
  end

  def preorder_only?
    stock_quantity <= 0 && allow_preorder?
  end

  # Storefront fulfillment gate. See Product#made_to_order? for why this is kept
  # separate from #preorder_only?.
  def made_to_order?
    allow_preorder?
  end

  # Lead time is a per-product setting, not per-variant.
  delegate :lead_time, to: :product

  def estimated_delivery_date
    return nil unless allow_preorder?

    preorder_estimated_delivery_date ||
      product.preorder_estimated_delivery_date ||
      (Date.current + (Setting.current.preorder_default_delivery_days || 30).days)
  end

  private

  def assign_option_signature
    ids = product_variant_options.reject(&:marked_for_destruction?).map(&:variant_option_id).compact
    self.option_signature = ids.any? ? ids.sort.join("-") : nil
  end

  def validate_variant_data
    # Combination approach: one or more option rows; the signature keeps it unique per product.
    if product_variant_options.reject(&:marked_for_destruction?).any?
      if option_signature.present? &&
         ProductVariant.where(product_id: product_id, option_signature: option_signature).where.not(id: id).exists?
        errors.add(:base, :combination_taken)
      end
    # Single-option approach: variant_type and variant_option on the row itself
    elsif variant_type_id.present? || variant_option_id.present?
      errors.add(:variant_type, "must be present") if variant_type_id.blank?
      errors.add(:variant_option, "must be present") if variant_option_id.blank?

      # Ensure uniqueness for new approach (only for new records or if variant_option changed)
      if variant_option_id.present? && (new_record? || variant_option_id_changed?)
        existing = ProductVariant.where(
          product_id: product_id,
          variant_option_id: variant_option_id
        ).where.not(id: id)
        errors.add(:variant_option, "already exists for this product") if existing.exists?
      end
    # Old approach: using name and value directly
    elsif name.present? || value.present?
      errors.add(:name, "can't be blank") if name.blank?
      errors.add(:value, "can't be blank") if value.blank?

      # Ensure uniqueness for old approach
      if name.present? && value.present?
        existing = ProductVariant.where(
          product_id: product_id,
          name: name,
          value: value
        ).where.not(id: id)
        errors.add(:value, "already exists for this product") if existing.exists?
      end
    else
      errors.add(:base, "Must have either variant_type/variant_option or name/value")
    end
  end

  def preorder_date_must_be_future
    if allow_preorder? && preorder_estimated_delivery_date.present?
      if preorder_estimated_delivery_date <= Date.current
        errors.add(:preorder_estimated_delivery_date, "must be in the future")
      end
    end
  end
end
