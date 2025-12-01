class CreateProductVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name, null: false
      t.string :value, null: false
      t.integer :stock_quantity, default: 0, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :product_variants, [:product_id, :name, :value], unique: true, name: 'index_variants_on_product_name_value'
  end
end
