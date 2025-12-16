class CreateUserCoupons < ActiveRecord::Migration[8.0]
  def change
    create_table :user_coupons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_coupons, [:user_id, :coupon_id]
    add_index :user_coupons, [:coupon_id, :user_id]
  end
end
