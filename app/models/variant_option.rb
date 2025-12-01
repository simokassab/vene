class VariantOption < ApplicationRecord
  belongs_to :variant_type
  has_many :product_variants, dependent: :restrict_with_error

  validates :value, presence: true, uniqueness: { scope: :variant_type_id }

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:position, :value) }

  def display_name
    value
  end
end
