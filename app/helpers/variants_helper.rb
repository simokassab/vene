# JSON payloads for the two variant UIs: the admin grid (Admin::Products form) and the
# storefront picker (products/show). Built here so the views only render them.
module VariantsHelper
  # Every active type with its active options, plus what this product already sells.
  # Options and types a variant still uses stay listed even when deactivated, so a save
  # never drops them.
  def admin_variant_matrix_data(product)
    variants = product.persisted? ? product.product_variants.includes(product_variant_options: :variant_type).to_a : []
    used_option_ids = variants.flat_map(&:option_ids).to_set
    used_type_ids = variants.flat_map { |v| v.product_variant_options.map(&:variant_type_id) }
    # Types this product already sells stay listed even when deactivated, or saving the
    # product would retire every combination that uses them.
    types = VariantType.where(active: true).or(VariantType.where(id: used_type_ids))
                       .ordered.includes(:variant_options).map do |type|
      options = type.variant_options.sort_by { |o| [ o.position, o.value ] }
                    .select { |o| o.active? || used_option_ids.include?(o.id) }
      { id: type.id, name: type.name, swatch: type.swatch?, drivesImages: type.drives_images?,
        options: options.map { |o| { id: o.id, label: o.value, swatch: o.swatch_color } } }
    end
    types.reject! { |t| t[:options].empty? }

    selected = types.to_h do |t|
      [ t[:id], t[:options].map { |o| o[:id] }.select { |id| used_option_ids.include?(id) } ]
    end
    rows = variants.select { |v| v.option_ids.any? }.to_h do |v|
      [ v.option_ids.sort.join("-"),
       { id: v.id, stock: v.stock_quantity, preorder: v.allow_preorder?, active: v.active?,
         date: v.preorder_estimated_delivery_date&.iso8601 || "" } ]
    end

    { types: types, selectedTypes: selected.select { |_, ids| ids.any? }.keys, selectedOptions: selected, rows: rows }
  end

  # The color options a photo can be tagged with: the options of the photo-driving type
  # that this product sells.
  def admin_image_color_options(product)
    used = ProductVariantOption.joins(:product_variant).where(product_variants: { product_id: product.id }).select(:variant_option_id)
    VariantOption.joins(:variant_type).where(variant_types: { drives_images: true }, id: used)
                 .ordered.pluck(:id, :value)
  end

  # Types, purchasable combinations and photos per color for the product page. One pass
  # over preloaded records; the page makes no further requests.
  def vn_variant_picker_data(product, images)
    variants = product.product_variants.active
                      .includes(product_variant_options: %i[variant_type variant_option]).to_a
    rows = variants.map(&:combination).flatten
    types = rows.map(&:variant_type).uniq.sort_by { |t| [ t.position, t.name ] }

    payload_types = types.map do |type|
      options = rows.select { |r| r.variant_type_id == type.id }.map(&:variant_option).uniq
                    .sort_by { |o| [ o.position, o.value ] }
      { id: type.id, name: type.localized_name, swatch: type.swatch?, drivesImages: type.drives_images?,
        size: !type.swatch? && type.name.to_s.match?(/size/i),
        options: options.map do |o|
          { id: o.id, slug: o.slug, label: o.label, swatch: o.swatch_color, default: o.default_choice? }
        end }
    end

    image_url = ->(img) { img.image.url }
    by_color = images.select(&:variant_option_id).group_by(&:variant_option_id).transform_values { |list| list.map(&image_url) }

    {
      types: payload_types,
      variants: variants.map do |v|
        { id: v.id, options: v.option_ids, stock: v.stock_quantity, purchasable: v.purchasable?,
          madeToOrder: product.made_to_order_with?(v), preorderOnly: v.preorder_only?,
          deliveryDate: v.estimated_delivery_date&.iso8601 }
      end,
      images: { shared: images.reject(&:variant_option_id).map(&image_url), byOption: by_color }
    }
  end
end
