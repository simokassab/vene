class Storefront::CategoriesController < ApplicationController
  def show
    @category = Category.includes(sub_categories: :products).find_by!(slug: params[:slug])
    @sort = params[:sort].presence || "featured"

    # Get all products from all subcategories in this category
    @products_query = Product.active
      .joins(:sub_category)
      .where(sub_categories: { category_id: @category.id })

    # Filter by subcategory if specified
    if params[:subcategory].present?
      @selected_subcategory = @category.sub_categories.find_by(slug: params[:subcategory])
      @products_query = @products_query.where(sub_category_id: @selected_subcategory.id) if @selected_subcategory
    end

    # Apply sorting
    @products = case @sort
                when "price_low"
                  @products_query.includes(:product_images).order(price: :asc)
                when "price_high"
                  @products_query.includes(:product_images).order(price: :desc)
                when "newest"
                  @products_query.includes(:product_images).order(created_at: :desc)
                else
                  @products_query.includes(:product_images).order(featured: :desc, created_at: :desc)
                end

    # Get active subcategories with product counts for filter sidebar
    @subcategories_with_counts = @category.sub_categories.active.ordered
      .joins(:products)
      .select("sub_categories.*, COUNT(products.id) as products_count")
      .where(products: { active: true })
      .group("sub_categories.id")
      .having("COUNT(products.id) > 0")
  end
end
