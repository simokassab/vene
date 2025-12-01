class CreateVariantTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :variant_types do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :variant_types, :name, unique: true
  end
end
