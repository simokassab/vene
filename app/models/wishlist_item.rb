class WishlistItem < ApplicationRecord
  # == Associations =========================================================
  belongs_to :user
  belongs_to :product
  belongs_to :product_variant, optional: true

  # == Validations ==========================================================
  validates :price_when_added, presence: true, numericality: { greater_than: 0 }
  validates :product_id, uniqueness: {
    scope: [:user_id, :product_variant_id],
    message: "is already in your wishlist"
  }

  # == Scopes ===============================================================
  scope :notify_stock, -> { where(notify_back_in_stock: true) }
  scope :notify_price, -> { where(notify_price_drop: true) }

  # == Ransack Configuration ================================================
  def self.ransackable_attributes(auth_object = nil)
    %w[id user_id product_id product_variant_id created_at notify_back_in_stock notify_price_drop]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user product product_variant]
  end

  # Items that can receive back-in-stock notifications (not notified in 24h)
  scope :stock_notifiable, -> {
    notify_stock.where(
      "back_in_stock_notified_at IS NULL OR back_in_stock_notified_at < ?",
      24.hours.ago
    )
  }

  # Items that can receive price-drop notifications (not notified in 24h)
  scope :price_notifiable, -> {
    notify_price.where(
      "price_drop_notified_at IS NULL OR price_drop_notified_at < ?",
      24.hours.ago
    )
  }

  # Items for a specific product that are notifiable for stock alerts
  scope :for_product_stock_alert, ->(product_id) {
    where(product_id: product_id).stock_notifiable
  }

  # Items for a specific product that are notifiable for price alerts
  scope :for_product_price_alert, ->(product_id) {
    where(product_id: product_id).price_notifiable
  }

  # == Callbacks ============================================================
  before_validation :set_price_when_added, on: :create

  # == Instance Methods =====================================================
  def in_stock?
    if product_variant.present?
      product_variant.stock_quantity > 0
    else
      product.stock_quantity > 0
    end
  end

  def current_price
    if product_variant.present? && product_variant.respond_to?(:price) && product_variant.price.present?
      product_variant.price
    else
      product.current_price
    end
  end

  def price_dropped?
    current_price < price_when_added
  end

  def price_drop_percentage
    return 0 unless price_dropped?
    ((price_when_added - current_price) / price_when_added * 100).round
  end

  def should_notify_stock?
    return false unless notify_back_in_stock?
    return false if notified_stock_recently?
    in_stock?
  end

  def should_notify_price?
    return false unless notify_price_drop?
    return false if notified_price_recently?
    return false unless price_dropped?

    # Only notify if price is lower than last notified price (or never notified)
    last_notified_price.nil? || current_price < last_notified_price
  end

  def mark_stock_notified!
    update!(back_in_stock_notified_at: Time.current)
  end

  def mark_price_notified!
    update!(
      price_drop_notified_at: Time.current,
      last_notified_price: current_price
    )
  end

  private

  def set_price_when_added
    return if price_when_added.present?

    self.price_when_added = current_price_for_item
  end

  def current_price_for_item
    if product_variant.present? && product_variant.respond_to?(:price) && product_variant.price.present?
      product_variant.price
    else
      product&.current_price
    end
  end

  def notified_stock_recently?
    back_in_stock_notified_at.present? && back_in_stock_notified_at > 24.hours.ago
  end

  def notified_price_recently?
    price_drop_notified_at.present? && price_drop_notified_at > 24.hours.ago
  end
end
