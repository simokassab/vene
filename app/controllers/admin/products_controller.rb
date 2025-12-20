class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @q = Product.includes(sub_category: :category, product_images: []).ransack(params[:q])
    @pagy, @products = pagy(@q.result, items: 20)
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def show; end

  def create
    @product = Product.new(product_params.except(:images, :product_variants_attributes))

    if @product.save
      process_variants
      attach_images
      redirect_to admin_products_path(locale: I18n.locale), notice: t("admin.products.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params.except(:images, :product_variants_attributes))
      process_variants
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
    params.require(:product).permit(:name_en, :name_ar, :description_en, :description_ar, :price, :sub_category_id,
                                    :stock_quantity, :metal, :diamonds, :gemstones, :others, :active, :slug,
                                    :featured, :on_sale, :sale_price, :video, :remove_video,
                                    :allow_preorder, :preorder_estimated_delivery_date, :preorder_note_en, :preorder_note_ar,
                                    related_product_ids: [],
                                    images: [],
                                    product_images_attributes: %i[id image position _destroy],
                                    product_variants_attributes: %i[id name value variant_type_id variant_option_id stock_quantity active allow_preorder preorder_estimated_delivery_date _destroy])
  end

  def attach_images
    return unless params.dig(:product, :images).present?

    starting_position = (@product.product_images.maximum(:position) || 0) + 1
    params[:product][:images].each_with_index do |image_file, idx|
      next if image_file.blank?

      @product.product_images.create(image: image_file, position: starting_position + idx)
    end
  end

  def process_variants
    return unless params.dig(:product, :product_variants_attributes).present?

    variants_params = params[:product][:product_variants_attributes].values

    variants_params.each do |variant_attrs|
      # Skip if variant_option_id is blank (no variant selected)
      next if variant_attrs[:variant_option_id].blank?

      # Convert stock_quantity to integer
      stock_qty = variant_attrs[:stock_quantity].to_i

      # Find existing variant or initialize new one
      if variant_attrs[:id].present?
        # Update existing variant
        variant = @product.product_variants.find_by(id: variant_attrs[:id])
        if variant
          variant.update(
            variant_type_id: variant_attrs[:variant_type_id],
            variant_option_id: variant_attrs[:variant_option_id],
            stock_quantity: stock_qty,
            active: variant_attrs[:active] == "1",
            allow_preorder: variant_attrs[:allow_preorder] == "1",
            preorder_estimated_delivery_date: variant_attrs[:preorder_estimated_delivery_date]
          )
        end
      else
        # Create new variant only if stock > 0 OR allow_preorder is true
        if stock_qty > 0 || variant_attrs[:allow_preorder] == "1"
          @product.product_variants.create(
            variant_type_id: variant_attrs[:variant_type_id],
            variant_option_id: variant_attrs[:variant_option_id],
            stock_quantity: stock_qty,
            active: variant_attrs[:active] == "1",
            allow_preorder: variant_attrs[:allow_preorder] == "1",
            preorder_estimated_delivery_date: variant_attrs[:preorder_estimated_delivery_date]
          )
        end
      end
    end

    # Remove variants that are no longer in the submitted data
    submitted_option_ids = variants_params.map { |v| v[:variant_option_id].to_i }.compact
    @product.product_variants.each do |variant|
      unless submitted_option_ids.include?(variant.variant_option_id)
        variant.destroy
      end
    end
  end
end
