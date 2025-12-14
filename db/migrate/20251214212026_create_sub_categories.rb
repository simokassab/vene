class CreateSubCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :sub_categories do |t|
      t.references :category, null: false, foreign_key: true, index: true
      t.string :name_en, null: false
      t.string :name_ar, null: false
      t.string :slug, null: false
      t.text :description_en
      t.text :description_ar
      t.string :image
      t.boolean :active, default: true, null: false
      t.integer :position, default: 0, null: false

      t.timestamps
    end

    add_index :sub_categories, :slug, unique: true
    add_index :sub_categories, :active
    add_index :sub_categories, [:category_id, :position]
  end
end
