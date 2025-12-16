class UserCoupon < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :coupon
  belongs_to :order

  # Validations
  validates :user_id, uniqueness: { scope: :coupon_id }
end
