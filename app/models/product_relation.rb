class ProductRelation < ApplicationRecord
  belongs_to :product
  belongs_to :related_product, class_name: "Product"

  validates :related_product_id, uniqueness: { scope: :product_id }
end
