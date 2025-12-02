class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :product_variant, optional: true

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit_price, :line_total, numericality: { greater_than_or_equal_to: 0 }
  validate :variant_required_if_product_has_variants
  validate :check_stock_availability

  before_validation :set_prices
  after_create :decrement_stock

  def variant_display_name
    product_variant&.display_name
  end

  private

  def set_prices
    self.unit_price = product&.current_price || 0 if unit_price.nil?
    self.line_total = unit_price.to_d * quantity.to_i
  end

  def variant_required_if_product_has_variants
    if product&.has_variants? && product_variant_id.blank?
      errors.add(:product_variant_id, "must be selected for this product")
    end
  end

  def check_stock_availability
    return unless product

    if product_variant_id.present?
      # Check variant stock
      if product_variant && product_variant.stock_quantity < quantity
        errors.add(:base, "Not enough stock available for #{product_variant.display_name}. Only #{product_variant.stock_quantity} available.")
      end
    else
      # Check product stock
      if product.stock_quantity < quantity
        errors.add(:base, "Not enough stock available. Only #{product.stock_quantity} available.")
      end
    end
  end

  def decrement_stock
    if product_variant_id.present?
      # Decrement variant stock
      product_variant.decrement!(:stock_quantity, quantity)
    else
      # Decrement product stock
      product.decrement!(:stock_quantity, quantity)
    end
  end
end
