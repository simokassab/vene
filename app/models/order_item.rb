class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :product_variant, optional: true

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit_price, :line_total, numericality: { greater_than_or_equal_to: 0 }
  validate :variant_required_if_product_has_variants
  validate :check_stock_availability

  before_validation :set_preorder_flag
  before_validation :set_prices
  # Stock is decremented only after payment confirmation via Order#decrement_stock!

  scope :preorders, -> { where(is_preorder: true) }
  scope :regular_orders, -> { where(is_preorder: false) }

  def variant_display_name
    product_variant&.display_name
  end

  # Called explicitly by Order#decrement_stock! after payment confirmation
  def decrement_stock!
    return if is_preorder?

    if product_variant_id.present?
      product_variant.decrement!(:stock_quantity, quantity)
    else
      product.decrement!(:stock_quantity, quantity)
    end
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
      variant = product_variant
      return unless variant

      unless variant.purchasable?
        errors.add(:base, "#{variant.display_name} is not available for purchase")
        return
      end

      if variant.stock_quantity > 0 && variant.stock_quantity < quantity
        errors.add(:base, "Not enough stock available for #{variant.display_name}. Only #{variant.stock_quantity} available.")
      end
    else
      unless product.purchasable?
        errors.add(:base, "#{product.name(I18n.locale)} is not available for purchase")
        return
      end

      if product.stock_quantity > 0 && product.stock_quantity < quantity
        errors.add(:base, "Not enough stock available. Only #{product.stock_quantity} available.")
      end
    end
  end

  def set_preorder_flag
    return unless product

    if product_variant_id.present?
      variant = product_variant
      self.is_preorder = variant&.preorder_only? || false
      self.preorder_estimated_delivery_date = variant&.estimated_delivery_date if is_preorder
    else
      self.is_preorder = product.preorder_only? || false
      self.preorder_estimated_delivery_date = product.estimated_delivery_date if is_preorder
    end
  end

  def preorder_status_label
    return unless is_preorder?

    if preorder_estimated_delivery_date
      I18n.t("orders.preorder_ships_by", date: I18n.l(preorder_estimated_delivery_date))
    else
      I18n.t("orders.preorder")
    end
  end
end
