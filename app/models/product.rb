class Product < ApplicationRecord
  belongs_to :sub_category
  has_one :category, through: :sub_category
  has_many :product_images, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  has_many :order_items
  has_many :product_relations, dependent: :destroy
  has_many :related_products, through: :product_relations, source: :related_product

  mount_uploader :video, ProductVideoUploader

  accepts_nested_attributes_for :product_images, allow_destroy: true

  before_validation :generate_slug

  validates :name_en, :name_ar, :price, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }
  validate :preorder_date_must_be_future

  scope :active, -> { where(active: true) }
  scope :recent, -> { order(created_at: :desc) }
  scope :featured, -> { where(featured: true) }
  scope :on_sale, -> { where(on_sale: true) }
  scope :preorder_available, -> { where(allow_preorder: true) }
  scope :available_for_purchase, -> { where("stock_quantity > 0 OR allow_preorder = true") }

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    %w[name_en name_ar description_en description_ar price sale_price stock_quantity
       metal diamonds gemstones slug active featured on_sale created_at updated_at sub_category_id
       allow_preorder preorder_estimated_delivery_date]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[sub_category category product_images]
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

    # First try same subcategory
    same_subcategory = Product.active
      .where(sub_category_id: sub_category_id)
      .where.not(id: id)
      .limit(limit)

    return same_subcategory if same_subcategory.count >= limit

    # Fall back to same category
    Product.active
      .joins(:sub_category)
      .where(sub_categories: { category_id: category.id })
      .where.not(id: id)
      .limit(limit)
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
      (Date.current + (Setting.current.preorder_default_delivery_days || 30).days)
  end

  def preorder_note(locale = I18n.locale)
    locale.to_sym == :ar ? preorder_note_ar : preorder_note_en
  end

  private

  def generate_slug
    if slug.blank? && name_en.present?
      base_slug = name_en.parameterize
      generated_slug = base_slug
      counter = 1

      # Ensure uniqueness by appending a number if needed
      while Product.where(slug: generated_slug).where.not(id: id).exists?
        generated_slug = "#{base_slug}-#{counter}"
        counter += 1
      end

      self.slug = generated_slug
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
