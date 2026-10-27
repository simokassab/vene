# Saves the admin variant grid: one row per combination (Yellow gold + 52), each with its
# own stock and made-to-order settings.
#
#   Products::VariantMatrixSyncService.new(product, rows).call
#   rows: [{ id:, option_ids: [12, 48], stock_quantity:, allow_preorder:, active:,
#            preorder_estimated_delivery_date: }]
#
# Combinations left out of the grid are deactivated when they were ever ordered or
# wishlisted (order history and alerts point at them) and deleted otherwise. Every row in
# the grid is saved, sold-out ones included, so the storefront can grey them out.
module Products
  class VariantMatrixSyncService
    Result = Data.define(:success?, :errors)

    def initialize(product, rows)
      @product = product
      @rows = Array(rows).map { |row| normalize(row) }.reject { |row| row[:option_ids].empty? }
    end

    def call
      errors = []
      ActiveRecord::Base.transaction do
        existing = @product.product_variants.includes(:variant_type, :variant_option, product_variant_options: :variant_type).to_a
        options = VariantOption.where(id: @rows.flat_map { |r| r[:option_ids] }.uniq).index_by(&:id)
        kept = []

        @rows.each do |row|
          variant = find_variant(existing, row) || @product.product_variants.build
          assign(variant, row, options)
          if variant.save
            kept << variant.id
          else
            errors.concat(variant.errors.full_messages.map { |m| "#{label(row, options)}: #{m}" })
          end
        end

        retire(existing.reject { |v| kept.include?(v.id) })
        raise ActiveRecord::Rollback if errors.any?
      end
      @product.product_variants.reset
      Result.new(errors.empty?, errors.uniq)
    end

    private

    def normalize(row)
      row = row.to_h.symbolize_keys
      {
        id: row[:id].presence&.to_i,
        option_ids: Array(row[:option_ids]).map(&:to_i).select(&:positive?).uniq.sort,
        stock_quantity: row[:stock_quantity].to_i.clamp(0, nil),
        allow_preorder: ActiveModel::Type::Boolean.new.cast(row[:allow_preorder]) || false,
        active: row.key?(:active) ? ActiveModel::Type::Boolean.new.cast(row[:active]) : true,
        preorder_estimated_delivery_date: row[:preorder_estimated_delivery_date].presence
      }
    end

    # By id first (scoped to this product), then by combination, so a variant whose row id
    # was lost, or that predates the backfill, keeps its orders and wishlist rows.
    def find_variant(existing, row)
      (row[:id] && existing.find { |v| v.id == row[:id] }) ||
        existing.find { |v| v.option_ids.sort == row[:option_ids] }
    end

    def assign(variant, row, options)
      variant.assign_attributes(row.slice(:stock_quantity, :allow_preorder, :active, :preorder_estimated_delivery_date))
      variant.preorder_estimated_delivery_date = nil unless row[:allow_preorder]
      return if variant.option_ids.sort == row[:option_ids] && variant.product_variant_options.any?

      variant.product_variant_options.each(&:mark_for_destruction)
      row[:option_ids].each do |id|
        option = options[id] or next
        variant.product_variant_options.build(variant_option: option, variant_type_id: option.variant_type_id)
      end
      # The combination rows are now the source of truth.
      variant.variant_type_id = nil
      variant.variant_option_id = nil
    end

    def retire(variants)
      variants.each do |variant|
        referenced = variant.order_items.exists? || WishlistItem.exists?(product_variant_id: variant.id)
        referenced ? variant.update_columns(active: false) : variant.destroy!
      end
    end

    def label(row, options)
      row[:option_ids].filter_map { |id| options[id]&.value }.join(" · ")
    end
  end
end
