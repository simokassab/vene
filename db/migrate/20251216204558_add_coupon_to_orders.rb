class AddCouponToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :coupon_code, :string
    add_column :orders, :discount_amount, :decimal, precision: 10, scale: 2, default: 0.0, null: false
    add_reference :orders, :coupon, foreign_key: true

    add_index :orders, :coupon_code
  end
end
