class Admin::ProductImagesController < Admin::BaseController
  before_action :set_product

  def create
    @product_image = @product.product_images.new(product_image_params)
    if @product_image.save
      redirect_to edit_admin_product_path(@product, locale: I18n.locale), notice: t("admin.product_images.created")
    else
      redirect_to edit_admin_product_path(@product, locale: I18n.locale), alert: @product_image.errors.full_messages.to_sentence
    end
  end

  def destroy
    image = @product.product_images.find(params[:id])
    image.destroy
    redirect_to edit_admin_product_path(@product, locale: I18n.locale), notice: t("admin.product_images.deleted")
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_image_params
    params.require(:product_image).permit(:image, :position)
  end
end
