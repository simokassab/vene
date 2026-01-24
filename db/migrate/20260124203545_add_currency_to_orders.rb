class AddCurrencyToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :currency, :string, default: "USD", null: false

    reversible do |dir|
      dir.up do
        # Backfill existing orders with the default currency
        execute "UPDATE orders SET currency = 'USD' WHERE currency IS NULL"
      end
    end
  end
end
