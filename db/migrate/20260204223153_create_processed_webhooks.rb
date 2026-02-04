class CreateProcessedWebhooks < ActiveRecord::Migration[8.0]
  def change
    create_table :processed_webhooks do |t|
      t.string :webhook_id, null: false
      t.string :webhook_type, null: false
      t.string :order_id
      t.jsonb :payload, default: {}
      t.datetime :processed_at, null: false

      t.timestamps
    end
    add_index :processed_webhooks, [:webhook_id, :webhook_type], unique: true
    add_index :processed_webhooks, :order_id
  end
end
