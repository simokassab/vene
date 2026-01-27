class Address < ApplicationRecord
  belongs_to :user

  validates :name, :phone, :country, :country_code, :city, :street_address, presence: true
  validates :country_code, length: { maximum: 2 }

  before_validation :set_country_code, if: -> { country.present? && country_code.blank? }

  scope :for_user, ->(user) { where(user: user).order(is_default: :desc, updated_at: :desc) }

  def full_address
    [street_address, building].compact_blank.join(", ")
  end

  def display_line
    [full_address, city, postal_code, country].compact_blank.join(", ")
  end

  private

  def set_country_code
    self.country_code = Dhl::Address.country_code_for(country)
  end
end
