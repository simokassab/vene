# One option of a variant's combination, at most one per variant type.
class ProductVariantOption < ApplicationRecord
  belongs_to :product_variant
  belongs_to :variant_type
  belongs_to :variant_option

  # One option per type is enforced by index_pv_options_one_per_type; a model uniqueness
  # check would trip while a variant's rows are being replaced in one save.
  validate :option_belongs_to_type

  private

  def option_belongs_to_type
    return if variant_option.nil? || variant_option.variant_type_id == variant_type_id

    errors.add(:variant_option, :wrong_type)
  end
end
