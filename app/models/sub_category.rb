class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :restrict_with_error

  mount_uploader :image, SubCategoryImageUploader

  validates :name_en, :name_ar, :slug, :category_id, presence: true
  validates :slug, uniqueness: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(position: :asc, name_en: :asc) }

  before_validation :generate_slug, if: -> { slug.blank? }

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    %w[name_en name_ar slug category_id active position created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category products]
  end

  # Multi-locale helper
  def name(locale = I18n.locale)
    locale.to_sym == :ar ? name_ar : name_en
  end

  def description(locale = I18n.locale)
    locale.to_sym == :ar ? description_ar : description_en
  end

  private

  def generate_slug
    if name_en.present?
      base_slug = "#{category.slug}-#{name_en.parameterize}"
      generated_slug = base_slug
      counter = 1

      while SubCategory.where(slug: generated_slug).where.not(id: id).exists?
        generated_slug = "#{base_slug}-#{counter}"
        counter += 1
      end

      self.slug = generated_slug
    end
  end
end
