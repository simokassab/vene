class AddPreorderFieldsToProductVariants < ActiveRecord::Migration[8.0]
  def change
    add_column :product_variants, :allow_preorder, :boolean, default: false, null: false
    add_column :product_variants, :preorder_estimated_delivery_date, :date

    add_index :product_variants, :allow_preorder
  end
end
