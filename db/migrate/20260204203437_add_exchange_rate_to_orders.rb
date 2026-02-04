class AddExchangeRateToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :exchange_rate, :decimal, precision: 12, scale: 6, default: 1.0, null: false
  end
end
