class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :shipping_method, null: false, default: "DHL"
      t.decimal :subtotal, precision: 10, scale: 2, default: 0, null: false
      t.decimal :tax_amount, precision: 10, scale: 2, default: 0, null: false
      t.decimal :shipping_amount, precision: 10, scale: 2, default: 0, null: false
      t.decimal :total_amount, precision: 10, scale: 2, default: 0, null: false
      t.string :tax_type, null: false, default: "local"
      t.string :status, null: false, default: "payment_pending"
      t.string :dhl_tracking_id
      t.string :payment_status, null: false, default: "pending"
      t.string :montypay_transaction_id
      t.string :payment_reference
      t.datetime :paid_at

      t.timestamps
    end

    add_index :orders, :status
    add_index :orders, :payment_status
    add_index :orders, :dhl_tracking_id
  end
end
