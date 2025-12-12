class AddPreorderSettingsToSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :settings, :preorder_enabled, :boolean, default: true, null: false
    add_column :settings, :preorder_default_delivery_days, :integer, default: 30
    add_column :settings, :preorder_disclaimer_en, :text,
               default: "Pre-order items are estimated to ship within the specified timeframe. Delivery dates are estimates and not guaranteed."
    add_column :settings, :preorder_disclaimer_ar, :text,
               default: "عناصر الطلب المسبق من المقدر شحنها خلال الإطار الزمني المحدد. تواريخ التسليم تقديرية وغير مضمونة."
  end
end
