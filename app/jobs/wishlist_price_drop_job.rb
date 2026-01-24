class WishlistPriceDropJob < ApplicationJob
  queue_as :default

  def perform(product_id)
    product = Product.find(product_id)
    current_price = product.current_price

    wishlist_items = WishlistItem.for_product_price_alert(product_id)
                                 .where("price_when_added > ?", current_price)

    wishlist_items.find_each do |wishlist_item|
      next unless wishlist_item.should_notify_price?

      WishlistMailer.price_drop(wishlist_item).deliver_now
      wishlist_item.mark_price_notified!
    end
  end
end
