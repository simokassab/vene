class Storefront::ProductsController < ApplicationController
  def index
    @products = Product.active.recent.includes(:product_images)
    @categories = Category.active.ordered
    Products::SwatchPreloadService.call(@products.load.records)
  end

  def show
    @product = Product.active.includes(:product_images).find_by!(slug: params[:slug])
    @related_products = @product.featured_related(4).includes(:product_images)
    Products::SwatchPreloadService.call(@related_products.load.records)
  end
end
