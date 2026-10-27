class AddStorefrontFieldsToVariantTypes < ActiveRecord::Migration[8.0]
  def change
    add_column :variant_types, :name_ar, :string
    add_column :variant_types, :position, :integer, default: 0, null: false
    add_column :variant_types, :display, :string, default: "text", null: false
    add_column :variant_types, :drives_images, :boolean, default: false, null: false

    add_column :variant_options, :value_ar, :string
    add_column :variant_options, :slug, :string
    add_column :variant_options, :swatch_color, :string
    add_column :variant_options, :default_choice, :boolean, default: false, null: false
    add_index :variant_options, %i[variant_type_id slug], unique: true, where: "slug IS NOT NULL"
    add_index :variant_options, :variant_type_id, unique: true, where: "default_choice",
              name: "index_variant_options_one_default_per_type"
  end
end
