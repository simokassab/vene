class Storefront::HomeController < ApplicationController
  def index
    @banners = Banner.active.ordered
    @featured_products = Product.active.recent
                                .includes(:product_images)
                                .limit(4)

    # Load scrolling featured products section
    @scrolling_featured_products = Product.active.featured
                                           .includes(:product_images)
                                           .limit(6)

    # Load categories with their active products and product images to avoid N+1 queries
    # We need to load all active products for each category since the view displays them
    @categories = Category.active.ordered
                          .includes(sub_categories: { products: :product_images })

    # Preload active products for each category to avoid N+1
    # This creates a hash mapping category_id to products for efficient lookup
    category_ids = @categories.map(&:id)
    @category_products = Product.joins(:sub_category)
                                .where(sub_categories: { category_id: category_ids })
                                .where(active: true)
                                .includes(:product_images, :sub_category)
                                .group_by { |p| p.sub_category.category_id }
  end
end
