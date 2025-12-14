class AddMaintenanceModeToSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :settings, :maintenance_mode, :boolean, default: false, null: false
  end
end
