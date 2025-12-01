class CreateVariantOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :variant_options do |t|
      t.references :variant_type, null: false, foreign_key: true
      t.string :value, null: false
      t.integer :position, default: 0, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :variant_options, [:variant_type_id, :value], unique: true
  end
end
