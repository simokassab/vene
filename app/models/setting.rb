class Setting < ApplicationRecord
  validates :store_name, :default_currency, :local_country, presence: true

  def self.current
    first_or_create!(
      store_name: "VENE Jewelry",
      local_tax_rate: 0,
      international_tax_rate: 0,
      shipping_flat_rate: 0,
      default_currency: "USD",
      local_country: "Lebanon",
      preorder_enabled: true,
      preorder_default_delivery_days: 30,
      preorder_disclaimer_en: "Pre-order items are estimated to ship within the specified timeframe. Delivery dates are estimates and not guaranteed.",
      preorder_disclaimer_ar: "عناصر الطلب المسبق من المقدر شحنها خلال الإطار الزمني المحدد. تواريخ التسليم تقديرية وغير مضمونة.",
      maintenance_mode: false
    )
  end

  def preorder_disclaimer(locale = I18n.locale)
    locale.to_sym == :ar ? preorder_disclaimer_ar : preorder_disclaimer_en
  end
end
