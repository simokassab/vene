class UpdateBannersProductFk < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :banners, :products, if_exists: true
    add_foreign_key :banners, :products, column: :product_id, on_delete: :nullify
  end
end
