class AddCodToSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :settings, :cod_enabled, :boolean, null: false, default: true
    add_column :settings, :cod_fee, :decimal, precision: 10, scale: 2, null: false, default: "10.0"
  end
end
