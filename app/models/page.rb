class Page < ApplicationRecord
  validates :title_en, :title_ar, :slug, presence: true
  validates :slug, uniqueness: true

  scope :active, -> { where(active: true) }

  def title(locale = I18n.locale)
    locale.to_sym == :ar ? title_ar : title_en
  end

  def content(locale = I18n.locale)
    locale.to_sym == :ar ? content_ar : content_en
  end
end
