class VariantOption < ApplicationRecord
  # Design-system metals (.vn-metal--yellow…) or, for anything else, a hex color.
  SWATCH_TOKENS = %w[yellow rose white].freeze
  SWATCH_FORMAT = /\A(?:#{SWATCH_TOKENS.join("|")}|#\h{6})\z/

  belongs_to :variant_type
  has_many :product_variants, dependent: :restrict_with_error
  has_many :product_variant_options, dependent: :restrict_with_error
  has_many :product_images, dependent: :nullify

  before_validation :generate_slug
  before_save :clear_other_defaults, if: -> { default_choice? && will_save_change_to_default_choice? }

  validates :value, presence: true, uniqueness: { scope: :variant_type_id }
  validates :slug, presence: true, uniqueness: { scope: :variant_type_id },
                   format: { with: /\A[a-z0-9-]+\z/ }
  validates :swatch_color, format: { with: SWATCH_FORMAT }, allow_blank: true

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:position, :value) }

  # Ids of the preselected options (Yellow gold). Tiny, and served from the query cache
  # within a request, so product cards can call it per card.
  def self.default_choice_ids
    where(default_choice: true).pluck(:id)
  end

  def display_name
    value
  end

  def label(locale = I18n.locale)
    (locale.to_sym == :ar && value_ar.presence) || value
  end

  private

  def generate_slug
    self.slug = value.to_s.parameterize.presence || "option-#{SecureRandom.hex(3)}" if slug.blank?
  end

  # One preselected option per type ("Yellow gold"); ticking another moves it.
  def clear_other_defaults
    VariantOption.where(variant_type_id: variant_type_id, default_choice: true)
                 .where.not(id: id).update_all(default_choice: false)
  end
end
