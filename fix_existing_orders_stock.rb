# Fix stock for existing orders (order_id=2 in your case)
# This should be run once in rails console

Order.where.not(status: 'canceled').each do |order|
  puts "Processing Order ##{order.id}..."
  
  order.order_items.each do |item|
    quantity = item.quantity
    
    if item.product_variant_id.present?
      variant = item.product_variant
      if variant
        puts "  - Decrementing variant #{variant.id} (#{variant.display_name}) by #{quantity}"
        variant.decrement!(:stock_quantity, quantity)
      end
    else
      product = item.product
      if product
        puts "  - Decrementing product #{product.id} by #{quantity}"
        product.decrement!(:stock_quantity, quantity)
      end
    end
  end
end

puts "\nDone! Stock quantities have been decremented for all existing orders."
