class AddSubCategoryToProducts < ActiveRecord::Migration[8.0]
  def change
    # Add the new column (nullable initially for data migration)
    add_reference :products, :sub_category, foreign_key: true, index: true

    # Remove null constraint from category_id temporarily for migration
    change_column_null :products, :category_id, true
  end
end
