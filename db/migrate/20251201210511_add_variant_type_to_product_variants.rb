class AddVariantTypeToProductVariants < ActiveRecord::Migration[8.0]
  def change
    add_reference :product_variants, :variant_type, null: true, foreign_key: true
    add_reference :product_variants, :variant_option, null: true, foreign_key: true
  end
end
