class Admin::SubCategoriesController < Admin::BaseController
  before_action :set_sub_category, only: %i[edit update destroy]
  before_action :load_categories, only: %i[new create edit update]

  def index
    @q = SubCategory.includes(:category).ransack(params[:q])
    @pagy, @sub_categories = pagy(@q.result.ordered, items: 20)
  end

  def new
    @sub_category = SubCategory.new
    @sub_category.category_id = params[:category_id] if params[:category_id]
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      redirect_to admin_sub_categories_path(locale: I18n.locale),
                  notice: t("admin.sub_categories.created", default: "Subcategory created successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @sub_category.update(sub_category_params)
      redirect_to admin_sub_categories_path(locale: I18n.locale),
                  notice: t("admin.sub_categories.updated", default: "Subcategory updated successfully")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @sub_category.destroy
      redirect_to admin_sub_categories_path(locale: I18n.locale),
                  notice: t("admin.sub_categories.deleted", default: "Subcategory deleted successfully")
    else
      redirect_to admin_sub_categories_path(locale: I18n.locale),
                  alert: t("admin.sub_categories.cannot_delete", default: "Cannot delete subcategory with products")
    end
  end

  private

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end

  def load_categories
    @categories = Category.ordered
  end

  def sub_category_params
    params.require(:sub_category).permit(
      :name_en, :name_ar, :slug, :description_en, :description_ar,
      :category_id, :active, :position, :image, :remove_image
    )
  end
end
