class AllowGuestOrders < ActiveRecord::Migration[8.0]
  def change
    # Make user_id nullable for guest orders
    change_column_null :orders, :user_id, true

    # Add guest identifier flag
    add_column :orders, :is_guest, :boolean, default: false, null: false
    add_index :orders, :is_guest

    # Add index for guest order lookup by email
    add_index :orders, :email
  end
end
