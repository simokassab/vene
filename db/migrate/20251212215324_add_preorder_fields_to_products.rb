class AddPreorderFieldsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :allow_preorder, :boolean, default: false, null: false
    add_column :products, :preorder_estimated_delivery_date, :date
    add_column :products, :preorder_note_en, :text
    add_column :products, :preorder_note_ar, :text

    add_index :products, :allow_preorder
  end
end
