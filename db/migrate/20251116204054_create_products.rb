class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name_en, null: false
      t.string :name_ar, null: false
      t.text :description_en
      t.text :description_ar
      t.decimal :price, precision: 10, scale: 2, null: false, default: 0
      t.references :category, null: false, foreign_key: true
      t.integer :stock_quantity, default: 0, null: false
      t.string :metal
      t.string :diamonds
      t.string :gemstones
      t.boolean :active, default: true, null: false
      t.string :slug, null: false

      t.timestamps
    end

    add_index :products, :slug, unique: true
  end
end
