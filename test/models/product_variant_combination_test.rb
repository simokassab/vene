require "test_helper"
require_relative "../support/variant_catalog"

class ProductVariantCombinationTest < ActiveSupport::TestCase
  include VariantCatalog

  self.fixture_table_names = []

  setup { build_catalog }

  test "a variant holds one option per type and reads them in type order" do
    sync([ row(@s52, @rose) ])
    variant = variant_for(@rose, @s52)

    assert_equal [ @rose.id, @s52.id ].sort.join("-"), variant.option_signature
    assert_equal "Rose gold · #{@size.name} 52", variant.display_name(:en)
    assert_equal "ذهب وردي · مقاس الخاتم 52", variant.display_name(:ar)
  end

  test "the same combination can't be created twice for a product" do
    sync([ row(@yellow, @s52) ])
    duplicate = @product.product_variants.build(stock_quantity: 1)
    duplicate.product_variant_options.build(variant_option: @yellow, variant_type: @color)
    duplicate.product_variant_options.build(variant_option: @s52, variant_type: @size)

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:base], I18n.t("activerecord.errors.messages.combination_taken")
  end

  test "an option must belong to the type it is filed under" do
    option_row = ProductVariantOption.new(variant_type: @size, variant_option: @rose)

    assert_not option_row.valid?
    assert option_row.errors.added?(:variant_option, :wrong_type)
  end

  test "a single-option variant from before the backfill still reads the same way" do
    legacy = @product.product_variants.create!(variant_type: @size, variant_option: @s54, stock_quantity: 1)

    assert_equal "#{@size.name} 54", legacy.display_name(:en)
    assert_equal [ @s54.id ], legacy.option_ids
  end

  test "a variant shows its color's photo, then the shared photo, then the cover" do
    shared = photo(nil, position: 0)
    rose_photo = photo(@rose, position: 1)
    sync([ row(@rose, @s52), row(@yellow, @s52) ])
    @product.product_images.reset

    assert_equal rose_photo, variant_for(@rose, @s52).primary_image
    assert_equal shared, variant_for(@yellow, @s52).primary_image
    assert_equal [ rose_photo, shared ], @product.images_for(@rose.id)
  end

  test "the cover photo is the default color's first photo" do
    photo(@rose, position: 0)
    yellow_photo = photo(@yellow, position: 1)

    assert_equal yellow_photo, @product.reload.primary_image
  end

  test "only one option per type is the default" do
    @rose.update!(default_choice: true)

    assert_not @yellow.reload.default_choice?
    assert_equal [ @rose.id ], @color.variant_options.where(default_choice: true).pluck(:id)
  end

  test "only one type changes the photos" do
    other = VariantType.new(name: "Finish #{SecureRandom.hex(2)}", drives_images: true)

    assert_not other.valid?
    assert other.errors.added?(:drives_images, :taken_by, other: @color.name)
  end

  test "an option gets a link slug and accepts brand metals or hex swatches only" do
    assert_equal "rose-gold", @rose.slug
    @rose.swatch_color = "#B76E79"
    assert @rose.valid?
    @rose.swatch_color = "pink"
    assert_not @rose.valid?
  end
end
