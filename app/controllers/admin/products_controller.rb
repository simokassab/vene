class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @q = Product.includes(:category, :product_images).ransack(params[:q])
    @pagy, @products = pagy(@q.result, items: 20)
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def show; end

  def create
    @product = Product.new(product_params.except(:images))
    if @product.save
      attach_images
      redirect_to admin_products_path(locale: I18n.locale), notice: t("admin.products.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params.except(:images))
      attach_images
      redirect_to admin_products_path(locale: I18n.locale), notice: t("admin.products.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path(locale: I18n.locale), notice: t("admin.products.deleted")
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name_en, :name_ar, :description_en, :description_ar, :price, :category_id,
                                    :stock_quantity, :metal, :diamonds, :gemstones, :active, :slug,
                                    :featured, :on_sale, :sale_price, :video, :remove_video,
                                    related_product_ids: [],
                                    images: [],
                                    product_images_attributes: %i[id image position _destroy],
                                    product_variants_attributes: %i[id name value variant_type_id variant_option_id stock_quantity active _destroy])
  end

  def attach_images
    return unless params.dig(:product, :images).present?

    starting_position = (@product.product_images.maximum(:position) || 0) + 1
    params[:product][:images].each_with_index do |image_file, idx|
      next if image_file.blank?

      @product.product_images.create(image: image_file, position: starting_position + idx)
    end
  end
end
