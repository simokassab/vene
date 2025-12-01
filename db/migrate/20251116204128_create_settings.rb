class CreateSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :settings do |t|
      t.string :store_name, null: false, default: "VENE Jewelry"
      t.decimal :local_tax_rate, precision: 5, scale: 2, null: false, default: 0
      t.decimal :international_tax_rate, precision: 5, scale: 2, null: false, default: 0
      t.decimal :shipping_flat_rate, precision: 10, scale: 2, null: false, default: 0
      t.string :default_currency, null: false, default: "USD"
      t.string :whatsapp_phone_number
      t.string :local_country, null: false, default: "Lebanon"
      t.string :montypay_merchant_id
      t.string :montypay_api_key

      t.timestamps
    end
  end
end
