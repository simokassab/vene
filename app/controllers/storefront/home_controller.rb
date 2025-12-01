class Storefront::HomeController < ApplicationController
  def index
    @banners = Banner.active.ordered
    @featured_products = Product.active.recent.limit(4)
    @categories = Category.active.ordered
  end
end
