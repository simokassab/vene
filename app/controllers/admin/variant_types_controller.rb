class Admin::VariantTypesController < Admin::BaseController
  before_action :set_variant_type, only: %i[show edit update destroy]

  def index
    @q = VariantType.includes(:variant_options).ransack(params[:q])
    @pagy, @variant_types = pagy(@q.result, items: 20)
  end

  def new
    @variant_type = VariantType.new
    3.times { @variant_type.variant_options.build }
  end

  def show; end

  def create
    @variant_type = VariantType.new(variant_type_params)
    if @variant_type.save
      redirect_to admin_variant_types_path(locale: I18n.locale), notice: t("admin.variant_types.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @variant_type.update(variant_type_params)
      redirect_to admin_variant_types_path(locale: I18n.locale), notice: t("admin.variant_types.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @variant_type.destroy
    redirect_to admin_variant_types_path(locale: I18n.locale), notice: t("admin.variant_types.deleted")
  end

  private

  def set_variant_type
    @variant_type = VariantType.includes(:variant_options).find(params[:id])
  end

  def variant_type_params
    params.require(:variant_type).permit(:name, :description, :active,
                                         variant_options_attributes: %i[id value position active _destroy])
  end
end
