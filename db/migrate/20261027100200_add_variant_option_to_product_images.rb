# A photo tagged with a color shows only when that color is selected; untagged photos
# show for every color.
class AddVariantOptionToProductImages < ActiveRecord::Migration[8.0]
  def change
    add_reference :product_images, :variant_option, foreign_key: { on_delete: :nullify }, index: false
    add_index :product_images, %i[product_id variant_option_id position]
  end
end
