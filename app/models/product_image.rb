class ProductImage < ApplicationRecord
  belongs_to :product

  mount_uploader :image, ProductImageUploader

  validates :image, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }

  default_scope { order(position: :asc, created_at: :asc) }
end
