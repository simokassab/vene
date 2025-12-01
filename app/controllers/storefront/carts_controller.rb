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
    cart.remove(params[:cart_key])
    redirect_to cart_path(locale: I18n.locale), notice: t("cart.updated")
  end
end
