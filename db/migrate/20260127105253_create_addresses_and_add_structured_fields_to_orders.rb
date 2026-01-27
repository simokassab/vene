class CreateAddressesAndAddStructuredFieldsToOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :label
      t.string :name, null: false
      t.string :phone, null: false
      t.string :country, null: false
      t.string :country_code, limit: 2, null: false
      t.string :city, null: false
      t.string :postal_code
      t.string :street_address, null: false
      t.string :building
      t.boolean :is_default, default: false, null: false
      t.timestamps
    end

    add_index :addresses, [:user_id, :is_default]

    add_reference :orders, :address, foreign_key: true, null: true
    add_column :orders, :postal_code, :string
    add_column :orders, :street_address, :string
    add_column :orders, :building, :string
    add_column :orders, :country_code, :string, limit: 2

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE orders SET street_address = address WHERE street_address IS NULL
        SQL
      end
    end
  end
end
