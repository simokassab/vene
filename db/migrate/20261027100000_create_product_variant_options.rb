# A variant is one sellable combination (Rose gold + 52). Each row here is one of its
# options, at most one per variant type. The old single variant_type_id/variant_option_id
# columns on product_variants stay until every environment has been backfilled.
class CreateProductVariantOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :product_variant_options do |t|
      t.references :product_variant, null: false, foreign_key: { on_delete: :cascade }, index: false
      t.references :variant_type, null: false, foreign_key: true
      t.references :variant_option, null: false, foreign_key: true
      t.timestamps
      t.index %i[product_variant_id variant_type_id], unique: true, name: "index_pv_options_one_per_type"
    end

    # Sorted option ids ("12-48"), so the same combination can't be created twice.
    add_column :product_variants, :option_signature, :string
    add_index :product_variants, %i[product_id option_signature], unique: true,
              where: "option_signature IS NOT NULL", name: "index_product_variants_on_signature"
  end
end
