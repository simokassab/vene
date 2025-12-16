class ChangeCouponForeignKeyOnOrders < ActiveRecord::Migration[8.0]
  def change
    # Remove the existing foreign key constraint
    remove_foreign_key :orders, :coupons

    # Add a new foreign key with on_delete: :nullify
    # This allows coupons to be deleted, and sets order.coupon_id to null
    # while preserving the coupon_code string for historical tracking
    add_foreign_key :orders, :coupons, on_delete: :nullify
  end
end
