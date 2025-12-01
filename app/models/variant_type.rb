class VariantType < ApplicationRecord
  has_many :variant_options, dependent: :destroy
  has_many :product_variants, dependent: :restrict_with_error

  accepts_nested_attributes_for :variant_options, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name description active created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[variant_options]
  end
end
