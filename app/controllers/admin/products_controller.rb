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
    @product = Product.new(product_params.except(:images))

    if save_with_variants { @product.save }
      attach_images
      redirect_to admin_products_path(locale: I18n.locale), notice: t("admin.products.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if save_with_variants { @product.update(product_params.except(:images)) }
      attach_images
      redirect_to admin_products_path(locale: I18n.locale), notice: t("admin.products.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path(locale: I18n.locale), notice: t("admin.products.deleted")
    else
      # Previously this reported success regardless, so a blocked delete looked like it worked.
      redirect_to admin_products_path(locale: I18n.locale), alert: destroy_error_message
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def destroy_error_message
    return t("admin.products.delete_blocked_by_orders") if @product.order_items.exists?

    @product.errors.full_messages.to_sentence.presence || t("admin.products.delete_failed")
  end

  def product_params
    params.require(:product).permit(:name_en, :name_ar, :description_en, :description_ar, :price, :sub_category_id,
                                    :stock_quantity, :metal, :diamonds, :gemstones, :others, :active, :slug,
                                    :featured, :on_sale, :sale_price, :video, :remove_video,
                                    :allow_preorder, :preorder_estimated_delivery_date, :preorder_note_en, :preorder_note_ar,
                                    :lead_time_en, :lead_time_ar,
                                    related_product_ids: [],
                                    images: [],
                                    product_images_attributes: %i[id image position variant_option_id _destroy])
  end

  # The grid posts product[variant_matrix][rows][n][option_ids][], stock and made-to-order
  # per combination. Only present when the variants card was on the page.
  def variant_matrix_rows
    matrix = params.dig(:product, :variant_matrix)
    return unless matrix&.dig(:submitted).present?

    rows = matrix.fetch(:rows, {})
    rows = rows.values if rows.respond_to?(:values)
    rows.map do |row|
      row.permit(:id, :stock_quantity, :allow_preorder, :active, :preorder_estimated_delivery_date, option_ids: []).to_h
    end
  end

  # Product and variants save together, so a bad combination doesn't leave half an edit.
  def save_with_variants
    rows = variant_matrix_rows
    saved = false
    Product.transaction do
      saved = yield
      if saved && rows
        result = Products::VariantMatrixSyncService.new(@product, rows).call
        unless result.success?
          result.errors.each { |message| @product.errors.add(:base, message) }
          saved = false
          raise ActiveRecord::Rollback
        end
      end
    end
    saved
  end

  def attach_images
    return unless params.dig(:product, :images).present?

    # One color for the whole batch, so five rose gold photos go up in one go.
    color_id = @product.product_variants.joins(:product_variant_options)
                       .where(product_variant_options: { variant_option_id: params.dig(:product, :images_variant_option_id) })
                       .pick("product_variant_options.variant_option_id")
    starting_position = (@product.product_images.maximum(:position) || 0) + 1
    params[:product][:images].each_with_index do |image_file, idx|
      next if image_file.blank?

      @product.product_images.create(image: image_file, position: starting_position + idx, variant_option_id: color_id)
    end
  end
end
