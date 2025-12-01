class Cart
  Item = Data.define(:product, :product_variant, :quantity) do
    def unit_price
      product.current_price
    end

    def line_total
      quantity * unit_price
    end

    def cart_key
      product_variant ? "#{product.id}_#{product_variant.id}" : product.id.to_s
    end
  end

  def initialize(session)
    @session = session
    @session[:cart] ||= {}
  end

  def add(product_id, quantity = 1, product_variant_id = nil)
    key = cart_key(product_id, product_variant_id)
    @session[:cart][key] = current_quantity(key) + quantity.to_i
  end

  def update(cart_key, quantity)
    qty = [quantity.to_i, 1].max
    @session[:cart][cart_key] = qty
  end

  def remove(cart_key)
    @session[:cart].delete(cart_key)
  end

  def clear
    @session[:cart] = {}
  end

  def items
    return [] if @session[:cart].blank?

    cart_data = @session[:cart].map do |key, quantity|
      product_id, variant_id = parse_cart_key(key)
      { product_id: product_id, variant_id: variant_id, quantity: quantity }
    end

    product_ids = cart_data.map { |d| d[:product_id] }.uniq
    variant_ids = cart_data.map { |d| d[:variant_id] }.compact.uniq

    products = Product.where(id: product_ids).index_by(&:id)
    variants = ProductVariant.where(id: variant_ids).index_by(&:id) if variant_ids.any?
    variants ||= {}

    cart_data.map do |data|
      product = products[data[:product_id]]
      next unless product

      variant = data[:variant_id] ? variants[data[:variant_id]] : nil
      Item.new(product: product, product_variant: variant, quantity: data[:quantity].to_i)
    end.compact
  end

  def subtotal
    items.sum(&:line_total)
  end

  private

  def cart_key(product_id, product_variant_id = nil)
    product_variant_id ? "#{product_id}_#{product_variant_id}" : product_id.to_s
  end

  def parse_cart_key(key)
    parts = key.to_s.split('_')
    if parts.length == 2
      [parts[0].to_i, parts[1].to_i]
    else
      [key.to_i, nil]
    end
  end

  def current_quantity(key)
    @session[:cart][key].to_i
  end
end
