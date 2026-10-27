class ProductImage < ApplicationRecord
  belongs_to :product
  # The color this photo shows. Untagged photos show for every color.
  belongs_to :variant_option, optional: true

  mount_uploader :image, ProductImageUploader

  validates :image, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }

  default_scope { order(position: :asc, created_at: :asc) }
end
