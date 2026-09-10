class Storefront::CartsController < ApplicationController
  def show
    @cart = Cart.new(session)
    purge_made_to_order(@cart, flash_now: true)
  end

  def add_item
    cart = Cart.new(session)
    product = Product.find(params[:product_id])

    # Validate variant selection if product has variants
    if product.has_variants? && params[:product_variant_id].blank?
      redirect_to product_path(product.slug, locale: I18n.locale), alert: t("cart.variant_required")
      return
    end

    # Made-to-order items are ordered over WhatsApp and never enter the cart.
    # Checked before purchasable?, which returns true for them and so stops nothing.
    # POST /cart/add_item is the only route that writes to the cart, so this one guard
    # covers every add-to-cart surface on the storefront.
    made_to_order_variant = params[:product_variant_id].present? ? product.product_variants.find_by(id: params[:product_variant_id]) : nil
    if product.made_to_order_with?(made_to_order_variant)
      redirect_to product_path(product.slug, locale: I18n.locale), alert: t("cart.made_to_order_only")
      return
    end

    # Validate product/variant is purchasable
    if params[:product_variant_id].present?
      # Scoped to this product: an unscoped find would let a variant of a different
      # product be bound to this cart key.
      variant = product.product_variants.find_by(id: params[:product_variant_id])
      unless variant&.purchasable?
        redirect_to product_path(product.slug, locale: I18n.locale),
                    alert: t("cart.not_available")
        return
      end
    else
      unless product.purchasable?
        redirect_to product_path(product.slug, locale: I18n.locale),
                    alert: t("cart.not_available")
        return
      end
    end

    cart.add(params[:product_id], params[:quantity] || 1, params[:product_variant_id])

    # GA4 ecommerce: stash add_to_cart so it fires on the page rendered after redirect
    variant = params[:product_variant_id].present? ? ProductVariant.find_by(id: params[:product_variant_id]) : nil
    flash[:ga4_event] = Ga4.add_to_cart_event(product, variant: variant, quantity: params[:quantity] || 1).to_json
    # Meta Pixel: stash AddToCart so it fires on the page rendered after redirect
    flash[:meta_pixel_event] = MetaPixel.add_to_cart_event(product, variant: variant, quantity: params[:quantity] || 1).to_json

    redirect_to safe_redirect_target, notice: t("cart.updated")
  end

  def update_item
    cart = Cart.new(session)
    cart.update(params[:cart_key], params[:quantity])
    redirect_to cart_path(locale: I18n.locale), notice: t("cart.updated")
  end

  def remove_item
    cart = Cart.new(session)

    # Debug logging
    Rails.logger.debug "=== REMOVE ITEM ==="
    Rails.logger.debug "Cart key param: #{params[:cart_key]}"
    Rails.logger.debug "Session cart before: #{session[:cart].inspect}"

    cart.remove(params[:cart_key])

    Rails.logger.debug "Session cart after: #{session[:cart].inspect}"

    redirect_to cart_path(locale: I18n.locale), notice: t("cart.item_removed", default: "Item removed from cart")
  end

  def apply_coupon
    cart = Cart.new(session)
    result = cart.apply_coupon(params[:coupon_code], current_user)

    if result[:success]
      redirect_to cart_path(locale: I18n.locale),
                  notice: t("coupons.applied", default: "Discount applied: %{discount}",
                            discount: result[:coupon].discount_display)
    else
      redirect_to cart_path(locale: I18n.locale), alert: result[:error]
    end
  end

  def remove_coupon
    cart = Cart.new(session)
    cart.remove_coupon
    redirect_to cart_path(locale: I18n.locale), notice: t("coupons.removed", default: "Coupon removed")
  end

  private

  # params[:redirect_to] is user-supplied (the Buy Now form sets it to the checkout path),
  # so it must not be passed to redirect_to unchecked.
  #
  # Checking only for a leading "/" is not enough: browsers normalise "/\evil.example" and
  # "//evil.example" into protocol-relative URLs, so the second character is checked too.
  def safe_redirect_target
    requested = params[:redirect_to].to_s
    return cart_path(locale: I18n.locale) if requested.blank?

    safe = requested.start_with?("/") && !requested[1, 1].to_s.match?(%r{[/\\]})
    safe ? requested : cart_path(locale: I18n.locale)
  end
end
