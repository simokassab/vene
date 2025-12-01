class Storefront::CategoriesController < ApplicationController
  def show
    @category = Category.find_by!(slug: params[:slug])
    @sort = params[:sort].presence || "featured"
    @products = @category.products.active

    @products = case @sort
                when "price_low"
                  @products.order(price: :asc)
                when "price_high"
                  @products.order(price: :desc)
                when "newest"
                  @products.order(created_at: :desc)
                else
                  @products.order(featured: :desc, created_at: :desc)
                end
  end
end
