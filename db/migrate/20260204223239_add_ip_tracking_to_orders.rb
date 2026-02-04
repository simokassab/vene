class AddIpTrackingToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :ip_address, :string
    add_column :orders, :user_agent, :string
    add_index :orders, :ip_address
  end
end
