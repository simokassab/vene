class CreateProductRelations < ActiveRecord::Migration[8.0]
  def change
    create_table :product_relations do |t|
      t.references :product, null: false, foreign_key: { to_table: :products }
      t.references :related_product, null: false, foreign_key: { to_table: :products }

      t.timestamps
    end

    add_index :product_relations, [:product_id, :related_product_id], unique: true
  end
end
