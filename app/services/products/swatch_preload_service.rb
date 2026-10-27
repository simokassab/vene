# Loads the color dots for a list of product cards in two queries, whatever the list's
# size: which photo-driving options (Yellow gold, Rose gold…) each product sells, and
# whether any combination in that color can be bought.
#
#   Products::SwatchPreloadService.call(@products)
#   product.swatch_options # => [Products::SwatchPreloadService::Swatch, ...]
#
# Card photos come from product_images, which listing pages already preload.
module Products
  class SwatchPreloadService
    Swatch = Data.define(:option, :available)

    def self.call(products)
      new(products).call
    end

    def initialize(products)
      @products = Array(products)
    end

    def call
      return @products if @products.empty?

      rows = ProductVariantOption.joins(:product_variant, :variant_type)
                                 .where(product_variants: { product_id: @products.map(&:id), active: true },
                                        variant_types: { drives_images: true })
                                 .group("product_variants.product_id", :variant_option_id)
                                 .pluck("product_variants.product_id", :variant_option_id,
                                        Arel.sql("BOOL_OR(product_variants.stock_quantity > 0 OR product_variants.allow_preorder)"))
      options = VariantOption.where(id: rows.map(&:second).uniq).index_by(&:id)
      by_product = rows.group_by(&:first)

      @products.each do |product|
        swatches = by_product.fetch(product.id, []).filter_map do |_, option_id, available|
          option = options[option_id]
          Swatch.new(option, available) if option
        end
        product.swatch_options = swatches.sort_by { |s| [ s.option.position, s.option.value ] }
      end
      @products
    end
  end
end
