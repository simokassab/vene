class CreateCoupons < ActiveRecord::Migration[8.0]
  def change
    create_table :coupons do |t|
      t.string :code, null: false
      t.string :discount_type, null: false, default: "percentage"
      t.decimal :discount_value, precision: 10, scale: 2, null: false, default: 0.0
      t.boolean :active, default: true, null: false
      t.date :valid_from
      t.date :valid_until
      t.boolean :single_use_per_user, default: false, null: false
      t.integer :usage_limit
      t.integer :usage_count, default: 0, null: false
      t.decimal :min_order_amount, precision: 10, scale: 2

      t.timestamps
    end

    add_index :coupons, :code, unique: true
    add_index :coupons, :active
    add_index :coupons, :discount_type
    add_index :coupons, [:valid_from, :valid_until]
  end
end
