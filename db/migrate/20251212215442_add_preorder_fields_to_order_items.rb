class AddPreorderFieldsToOrderItems < ActiveRecord::Migration[8.0]
  def change
    add_column :order_items, :is_preorder, :boolean, default: false, null: false
    add_column :order_items, :preorder_estimated_delivery_date, :date

    add_index :order_items, :is_preorder
  end
end
