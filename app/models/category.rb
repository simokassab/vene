class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  has_many :products, through: :sub_categories

  mount_uploader :image, CategoryImageUploader

  validates :name_en, :name_ar, :slug, presence: true
  validates :slug, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(position: :asc) }

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    %w[name_en name_ar slug active position created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[sub_categories products]
  end

  def name(locale = I18n.locale)
    locale.to_sym == :ar ? name_ar : name_en
  end

  # Get active subcategories with product counts (optimized for mega menu)
  def active_sub_categories_with_products
    sub_categories.active.ordered
      .joins(:products)
      .select("sub_categories.*, COUNT(products.id) as products_count")
      .where(products: { active: true })
      .group("sub_categories.id")
      .having("COUNT(products.id) > 0")
  end
end
