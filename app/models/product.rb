class Product < ApplicationRecord
  belongs_to :category
  has_many :product_images, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  has_many :order_items
  has_many :product_relations, dependent: :destroy
  has_many :related_products, through: :product_relations, source: :related_product

  mount_uploader :video, ProductVideoUploader

  accepts_nested_attributes_for :product_images, allow_destroy: true
  accepts_nested_attributes_for :product_variants, allow_destroy: true, reject_if: :all_blank

  validates :name_en, :name_ar, :price, :slug, presence: true
  validates :slug, uniqueness: true
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :active, -> { where(active: true) }
  scope :recent, -> { order(created_at: :desc) }
  scope :featured, -> { where(featured: true) }
  scope :on_sale, -> { where(on_sale: true) }

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    %w[name_en name_ar description_en description_ar price sale_price stock_quantity
       metal diamonds gemstones slug active featured on_sale created_at updated_at category_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category product_images]
  end

  def name(locale = I18n.locale)
    locale.to_sym == :ar ? name_ar : name_en
  end

  def description(locale = I18n.locale)
    locale.to_sym == :ar ? description_ar : description_en
  end

  def primary_image
    product_images.order(:position).first
  end

  def featured_related(limit = 4)
    return related_products.active.limit(limit) if related_products.any?

    Product.active.where(category_id: category_id).where.not(id: id).limit(limit)
  end

  def on_sale_with_price?
    on_sale? && sale_price.present?
  end

  def current_price
    return price unless on_sale_with_price?

    sale_price
  end

  def discount_percentage
    return 0 unless on_sale_with_price? && price.to_d.positive?

    ((price - sale_price) / price * 100).round
  end

  def has_variants?
    product_variants.active.any?
  end
end
