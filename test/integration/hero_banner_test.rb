require "test_helper"

class HeroBannerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  self.fixture_table_names = []

  setup do
    Setting.current
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/ring.jpg"), "image/jpeg")
    @banner = Banner.create!(image: file, title_en: "Handcrafted in Beirut. Made for the world.", active: true, image_focus: 88)
  end

  test "the hero crops the photo at the banner's focus and sizes the title to its column" do
    get root_path(locale: :en)

    assert_response :success
    assert_includes response.body, "object-position: 88% 50%"
    assert_select "h1.vn-display-xl--fit", text: @banner.title_en
  end

  test "the admin saves the photo focus and refuses one outside 0 to 100" do
    sign_in create_admin, scope: :admin_user

    get edit_admin_banner_path(@banner, locale: :en)
    assert_select "input[type=range][name='banner[image_focus]'][value='88']"

    patch admin_banner_path(@banner, locale: :en), params: { banner: { image_focus: 30 } }
    assert_equal 30, @banner.reload.image_focus

    patch admin_banner_path(@banner, locale: :en), params: { banner: { image_focus: 140 } }
    assert_equal 30, @banner.reload.image_focus
  end

  private

  def create_admin
    secret = SecureRandom.hex(12)
    User.create!(name: "Admin Person", phone: "+96170000000", email: "admin-#{SecureRandom.hex(4)}@example.com",
                 password: secret, password_confirmation: secret, role: "admin")
  end
end
