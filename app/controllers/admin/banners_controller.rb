class Admin::BannersController < Admin::BaseController
  before_action :set_banner, only: %i[edit update destroy]

  def index
    @banners = Banner.ordered
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      redirect_to admin_banners_path(locale: I18n.locale), notice: t("admin.banners.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @banner.update(banner_params)
      redirect_to admin_banners_path(locale: I18n.locale), notice: t("admin.banners.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @banner.destroy
    redirect_to admin_banners_path(locale: I18n.locale), notice: t("admin.banners.deleted")
  end

  private

  def set_banner
    @banner = Banner.find(params[:id])
  end

  def banner_params
    params.require(:banner).permit(:image, :title_en, :title_ar, :subtitle_en, :subtitle_ar, :active, :position, :product_id, :url)
  end
end
