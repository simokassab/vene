class Setting < ApplicationRecord
  validates :store_name, :default_currency, :local_country, presence: true

  def self.current
    first_or_create!(store_name: "VENE Jewelry", local_tax_rate: 0, international_tax_rate: 0,
                     shipping_flat_rate: 0, default_currency: "USD", local_country: "Lebanon")
  end
end
