class MigrateProductsToSubcategories < ActiveRecord::Migration[8.0]
  def up
    # For each category, create a default "General" subcategory
    Category.find_each do |category|
      subcategory = SubCategory.create!(
        category: category,
        name_en: "General #{category.name_en}",
        name_ar: "عام #{category.name_ar}",
        slug: "#{category.slug}-general",
        active: category.active,
        position: 0,
        image: nil  # Will be set manually later
      )

      # Move all products from this category to the new subcategory
      Product.where(category_id: category.id).update_all(sub_category_id: subcategory.id)
    end
  end

  def down
    # Reverse: set products back to their category based on subcategory
    Product.joins(:sub_category).find_each do |product|
      product.update_column(:category_id, product.sub_category.category_id)
    end

    # Delete all subcategories
    SubCategory.delete_all
  end
end
