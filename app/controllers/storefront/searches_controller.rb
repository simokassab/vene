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
  end
end
