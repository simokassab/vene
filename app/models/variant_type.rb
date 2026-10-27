class VariantType < ApplicationRecord
  DISPLAYS = %w[text swatch].freeze

  has_many :variant_options, dependent: :destroy
  has_many :product_variants, dependent: :restrict_with_error
  has_many :product_variant_options, dependent: :restrict_with_error

  accepts_nested_attributes_for :variant_options, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true
  validates :display, inclusion: { in: DISPLAYS }
  validate :only_one_type_drives_images

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:position, :name) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name name_ar description active position display drives_images created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[variant_options]
  end

  # English stays in `name` so existing callers keep working; Arabic falls back to it.
  def localized_name(locale = I18n.locale)
    (locale.to_sym == :ar && name_ar.presence) || name
  end

  def swatch?
    display == "swatch"
  end

  private

  # The product page swaps photos on exactly one choice (the color).
  def only_one_type_drives_images
    return unless drives_images?

    others = VariantType.where(drives_images: true).where.not(id: id)
    errors.add(:drives_images, :taken_by, other: others.first.name) if others.exists?
  end
end
