class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  mount_uploader :image, CategoryImageUploader

  validates :name_en, :name_ar, :slug, presence: true
  validates :slug, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(position: :asc) }

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    %w[name_en name_ar slug active position created_at updated_at]
  end

  def name(locale = I18n.locale)
    locale.to_sym == :ar ? name_ar : name_en
  end
end
