require "test_helper"

class VeneHelperTest < ActionView::TestCase
  include ApplicationHelper

  # Pure view helpers: no fixtures needed (and test/fixtures/products.yml predates sub_categories).
  self.fixture_table_names = []

  def visitor_currency = "USD"

  test "vn_icon draws the named stroke paths, hidden from assistive tech" do
    svg = vn_icon(:bag, size: 22)

    assert_includes svg, 'width="22"'
    assert_includes svg, 'stroke-width="1.25"'
    assert_includes svg, 'aria-hidden="true"'
    assert_equal VeneHelper::ICON_PATHS[:bag].size, svg.scan("<path").size
  end

  test "vn_icon with a label is announced as an image" do
    assert_includes vn_icon(:heart, label: "Wishlist"), 'aria-label="Wishlist"'
  end

  test "vn_price wraps the amount in bdi and drops decimals on whole amounts" do
    assert_dom_equal '<bdi class="font-latin vn-num vn-price">$2,762</bdi>', vn_price(2762)
    assert_includes vn_price(19.5), "$19.50"
  end

  test "vn_arrow mirrors in Arabic" do
    I18n.with_locale(:ar) { assert_equal "←", vn_arrow }
    I18n.with_locale(:en) { assert_equal "→", vn_arrow }
  end

  test "flash keys map to notice tones" do
    assert_equal :error, vn_flash_tone(:alert)
    assert_equal :success, vn_flash_tone("notice")
    assert_equal :note, vn_flash_tone(:info)
  end
end
