class AddImageToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :image, :string
  end
end
