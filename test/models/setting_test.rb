require "test_helper"

class SettingTest < ActiveSupport::TestCase
  # The repo's scaffold fixtures predate the current schema; build settings inline.
  self.fixture_table_names = []

  def setting(local: "Lebanon", enabled: true)
    Setting.new(store_name: "S", default_currency: "USD", local_country: local,
                cod_enabled: enabled, cod_fee: 10)
  end

  test "COD is available only for the configured local country" do
    s = setting(local: "Lebanon")

    assert s.cod_available_for_country?("Lebanon")
    assert s.cod_available_for_country?("لبنان"), "Arabic country name should resolve"
    assert s.cod_available_for_country?("LB"), "ISO alpha-2 form should resolve"

    # A non-local ship-to country is never eligible. Because eligibility is keyed
    # purely on the destination country name, there is no separate country_code
    # field a client could spoof to "LB" while shipping to France.
    assert_not s.cod_available_for_country?("France")
    assert_not s.cod_available_for_country?("")
    assert_not s.cod_available_for_country?(nil)
  end

  test "COD respects the enabled toggle" do
    assert_not setting(local: "Lebanon", enabled: false).cod_available_for_country?("Lebanon")
  end

  test "COD eligibility follows a different configured local country" do
    s = setting(local: "United Arab Emirates")

    assert s.cod_available_for_country?("United Arab Emirates")
    assert s.cod_available_for_country?("AE")
    assert_not s.cod_available_for_country?("Lebanon")
  end

  test "country_alpha2 resolves names, codes and locales to a 2-char ISO code" do
    assert_equal "LB", Setting.country_alpha2("Lebanon")
    assert_equal "LB", Setting.country_alpha2("لبنان")
    assert_equal "LB", Setting.country_alpha2("LB")
    assert_equal "FR", Setting.country_alpha2("France")
    assert_equal "AE", Setting.country_alpha2("United Arab Emirates")
    assert_nil Setting.country_alpha2("")
  end
end
