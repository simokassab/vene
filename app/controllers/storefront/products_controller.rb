class Storefront::ProductsController < ApplicationController
  def index
    @products = Product.active.recent.includes(:product_images)
    @categories = Category.active.ordered
  end

  def show
    @product = Product.active.includes(:product_images).find_by!(slug: params[:slug])
    @related_products = @product.featured_related(4).includes(:product_images)
  end
end
