class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[customer admin].freeze

  has_many :orders, dependent: :nullify
  has_many :user_coupons, dependent: :destroy
  has_many :coupons, through: :user_coupons

  validates :name, presence: true
  validates :role, inclusion: { in: ROLES }
  validates :phone, presence: true

  before_validation :set_default_role

  enum :role, customer: "customer", admin: "admin"

  def admin?
    role == "admin"
  end

  private

  def set_default_role
    self.role ||= "customer"
  end
end
