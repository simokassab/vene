class FinalizeProductSubcategoryMigration < ActiveRecord::Migration[8.0]
  def up
    # Make sub_category_id required
    change_column_null :products, :sub_category_id, false

    # Remove category_id column (products now only belong to subcategories)
    remove_foreign_key :products, :categories
    remove_index :products, :category_id
    remove_column :products, :category_id
  end

  def down
    # Restore category_id column
    add_reference :products, :category, index: true
    add_foreign_key :products, :categories

    # Populate category_id from subcategory
    Product.joins(:sub_category).find_each do |product|
      product.update_column(:category_id, product.sub_category.category_id)
    end

    change_column_null :products, :category_id, false
    change_column_null :products, :sub_category_id, true
  end
end
