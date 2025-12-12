class ProductVariant < ApplicationRecord
  belongs_to :product
  belongs_to :variant_type, optional: true
  belongs_to :variant_option, optional: true
  has_many :order_items, dependent: :restrict_with_error

  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }

  # For new approach: validate variant_type and variant_option presence
  # For old approach: validate name and value presence
  validate :validate_variant_data
  validate :preorder_date_must_be_future

  scope :active, -> { where(active: true) }
  scope :in_stock, -> { where("stock_quantity > ?", 0) }
  scope :preorder_available, -> { where(allow_preorder: true) }
  scope :purchasable, -> { where("stock_quantity > 0 OR allow_preorder = true") }

  def display_name
    if variant_type && variant_option
      "#{variant_type.name}: #{variant_option.value}"
    else
      "#{name}: #{value}"
    end
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

  def estimated_delivery_date
    return nil unless allow_preorder?

    preorder_estimated_delivery_date ||
      product.preorder_estimated_delivery_date ||
      (Date.current + (Setting.current.preorder_default_delivery_days || 30).days)
  end

  private

  def validate_variant_data
    # New approach: using variant_type and variant_option
    if variant_type_id.present? || variant_option_id.present?
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
