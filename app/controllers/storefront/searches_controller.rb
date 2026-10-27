class Storefront::SearchesController < ApplicationController
  def index
    @query = params[:q].to_s.strip
    @products = if @query.present?
                  Product.active
                         .where("LOWER(name_en) LIKE :q OR LOWER(name_ar) LIKE :q", q: "%#{@query.downcase}%")
                         .includes(:sub_category, :product_images)
                         .order(created_at: :desc)
                else
                  Product.none
                end
    @color_options = @query.present? ? Product.color_options_for(@products).to_a : []
    @selected_color = @color_options.find { |o| o.slug == params[:color] }
    @products = @products.in_color(@selected_color) if @selected_color
    Products::SwatchPreloadService.call(@products.load.records)
  end
end
