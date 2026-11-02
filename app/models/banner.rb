class Banner < ApplicationRecord
  belongs_to :product, optional: true

  mount_uploader :image, BannerUploader

  validates :image, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :image_focus, numericality: { only_integer: true, in: 0..100 }

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(position: :asc, created_at: :asc) }

  def title(locale = I18n.locale)
    locale.to_sym == :ar ? title_ar : title_en
  end

  def subtitle(locale = I18n.locale)
    locale.to_sym == :ar ? subtitle_ar : subtitle_en
  end
end
