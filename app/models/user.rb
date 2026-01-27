class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[customer admin].freeze

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :nullify
  has_many :user_coupons, dependent: :destroy
  has_many :coupons, through: :user_coupons
  has_many :wishlist_items, dependent: :destroy
  has_many :wishlisted_products, through: :wishlist_items, source: :product

  validates :name, presence: true
  validates :role, inclusion: { in: ROLES }
  validates :phone, presence: true

  before_validation :set_default_role

  enum :role, customer: "customer", admin: "admin"

  def admin?
    role == "admin"
  end

  def product_in_wishlist?(product, variant = nil)
    wishlist_items.exists?(product_id: product.id, product_variant_id: variant&.id)
  end

  def default_address_record
    addresses.find_by(is_default: true) || addresses.order(updated_at: :desc).first
  end

  def wishlist_item_for(product, variant = nil)
    wishlist_items.find_by(product_id: product.id, product_variant_id: variant&.id)
  end

  private

  def set_default_role
    self.role ||= "customer"
  end
end
