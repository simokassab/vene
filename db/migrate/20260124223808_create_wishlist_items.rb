class CreateWishlistItems < ActiveRecord::Migration[8.0]
  def change
    create_table :wishlist_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :product_variant, null: true, foreign_key: true

      # Price tracking for price drop detection
      t.decimal :price_when_added, precision: 10, scale: 2, null: false

      # Notification state (prevent spam)
      t.datetime :back_in_stock_notified_at
      t.datetime :price_drop_notified_at
      t.decimal :last_notified_price, precision: 10, scale: 2

      # User preferences
      t.boolean :notify_back_in_stock, default: true, null: false
      t.boolean :notify_price_drop, default: true, null: false

      t.timestamps
    end

    add_index :wishlist_items, [:user_id, :product_id, :product_variant_id],
              unique: true, name: "idx_wishlist_user_product_variant"
  end
end
