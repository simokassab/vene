# Builds a small catalog for variant-combination tests: a Color type that drives photos
# (Yellow gold is the default), a Ring size type and one product.
module VariantCatalog
  def build_catalog
    @color = VariantType.create!(name: "Color #{SecureRandom.hex(3)}", name_ar: "اللون", display: "swatch",
                                 drives_images: true, position: 0)
    @yellow = @color.variant_options.create!(value: "Yellow gold", value_ar: "ذهب أصفر", swatch_color: "yellow", default_choice: true)
    @rose = @color.variant_options.create!(value: "Rose gold", value_ar: "ذهب وردي", swatch_color: "rose", position: 1)
    @size = VariantType.create!(name: "Ring size #{SecureRandom.hex(3)}", name_ar: "مقاس الخاتم", position: 1)
    @s52 = @size.variant_options.create!(value: "52")
    @s54 = @size.variant_options.create!(value: "54", position: 1)

    category = Category.create!(name_en: "Rings", name_ar: "خواتم", slug: "rings-#{SecureRandom.hex(4)}")
    sub = SubCategory.create!(name_en: "Solitaire", name_ar: "سوليتير", slug: "solitaire-#{SecureRandom.hex(4)}",
                              category: category)
    @product = Product.create!(name_en: "Lumen", name_ar: "لومن", price: 100, stock_quantity: 0,
                               sub_category: sub, slug: "lumen-#{SecureRandom.hex(4)}")
  end

  def row(*options, stock: 1, preorder: false, id: nil)
    { id: id, option_ids: options.map(&:id), stock_quantity: stock, allow_preorder: preorder, active: true }
  end

  def sync(rows)
    Products::VariantMatrixSyncService.new(@product, rows).call
  end

  def variant_for(*options)
    @product.product_variants.reload.find { |v| v.option_signature == options.map(&:id).sort.join("-") }
  end

  def photo(option = nil, position: 0)
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/ring.jpg"), "image/jpeg")
    @product.product_images.create!(image: file, position: position, variant_option: option)
  end
end
