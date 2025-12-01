class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: %i[edit update destroy]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path(locale: I18n.locale), notice: t("admin.pages.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path(locale: I18n.locale), notice: t("admin.pages.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path(locale: I18n.locale), notice: t("admin.pages.deleted")
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title_en, :title_ar, :slug, :content_en, :content_ar, :active)
  end
end
