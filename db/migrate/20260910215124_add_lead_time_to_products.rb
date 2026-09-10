class AddLeadTimeToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :lead_time_en, :string
    add_column :products, :lead_time_ar, :string
  end
end
