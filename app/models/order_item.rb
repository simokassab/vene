class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :product_variant, optional: true

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit_price, :line_total, numericality: { greater_than_or_equal_to: 0 }
  validate :variant_required_if_product_has_variants

  before_validation :set_prices

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
end
