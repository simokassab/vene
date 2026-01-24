module WishlistNotifiable
  extend ActiveSupport::Concern

  included do
    after_update :check_stock_change
    after_update :check_price_change
  end

  private

  def check_stock_change
    return unless saved_change_to_stock_quantity?

    previous_stock, current_stock = saved_change_to_stock_quantity
    return if previous_stock.nil?

    # Trigger back-in-stock notification when stock goes from 0 to positive
    if previous_stock <= 0 && current_stock > 0
      WishlistBackInStockJob.perform_later(id)
    end
  end

  def check_price_change
    price_changed = saved_change_to_price? || saved_change_to_sale_price? || saved_change_to_on_sale?

    return unless price_changed

    # Only notify if price went down
    previous_price = previous_current_price
    new_price = current_price

    if previous_price.present? && new_price < previous_price
      WishlistPriceDropJob.perform_later(id)
    end
  end

  def previous_current_price
    was_on_sale = saved_change_to_on_sale? ? saved_change_to_on_sale[0] : on_sale?

    if was_on_sale
      saved_change_to_sale_price? ? saved_change_to_sale_price[0] : sale_price
    else
      saved_change_to_price? ? saved_change_to_price[0] : price
    end
  end
end
