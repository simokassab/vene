class WishlistBackInStockJob < ApplicationJob
  queue_as :default

  def perform(product_id, variant_id = nil)
    wishlist_items = WishlistItem.for_product_stock_alert(product_id)
    wishlist_items = wishlist_items.where(product_variant_id: variant_id) if variant_id.present?

    wishlist_items.find_each do |wishlist_item|
      next unless wishlist_item.should_notify_stock?

      WishlistMailer.back_in_stock(wishlist_item).deliver_now
      wishlist_item.mark_stock_notified!
    end
  end
end
