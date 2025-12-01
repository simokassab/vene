class MakeProductVariantNameValueNullable < ActiveRecord::Migration[8.0]
  def change
    change_column_null :product_variants, :name, true
    change_column_null :product_variants, :value, true
  end
end
