class Storefront::CartsController < ApplicationController
  def show
    @cart = Cart.new(session)
  end

  def add_item
    cart = Cart.new(session)
    product = Product.find(params[:product_id])

    # Validate variant selection if product has variants
    if product.has_variants? && params[:product_variant_id].blank?
      redirect_to product_path(product.slug, locale: I18n.locale), alert: t("cart.variant_required")
      return
    end

    # Validate product/variant is purchasable
    if params[:product_variant_id].present?
      variant = ProductVariant.find(params[:product_variant_id])
      unless variant.purchasable?
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
    redirect_target = params[:redirect_to].presence || cart_path(locale: I18n.locale)
    redirect_to redirect_target, notice: t("cart.updated")
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
end
