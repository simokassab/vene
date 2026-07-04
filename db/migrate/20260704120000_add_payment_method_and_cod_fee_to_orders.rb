class AddPaymentMethodAndCodFeeToOrders < ActiveRecord::Migration[8.0]
  def up
    add_column :orders, :payment_method, :string, null: false, default: "card"
    add_column :orders, :cod_fee, :decimal, precision: 10, scale: 2, null: false, default: "0.0"
    add_column :orders, :stock_decremented, :boolean, null: false, default: false
    add_index :orders, :payment_method

    # Backfill: orders already marked paid had their stock decremented under the
    # prior logic (Order#confirm_payment!), so preserve cancel/restore behavior.
    execute("UPDATE orders SET stock_decremented = TRUE WHERE payment_status = 'paid'")
  end

  def down
    remove_index :orders, :payment_method
    remove_column :orders, :stock_decremented
    remove_column :orders, :cod_fee
    remove_column :orders, :payment_method
  end
end
