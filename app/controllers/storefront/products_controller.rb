class Storefront::ProductsController < ApplicationController
  def index
    @products = Product.active.recent
    @categories = Category.active.ordered
  end

  def show
    @product = Product.active.find_by!(slug: params[:slug])
    @related_products = @product.featured_related(4)
  end
end
