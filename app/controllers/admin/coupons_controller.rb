class Admin::CouponsController < Admin::BaseController
  before_action :set_coupon, only: %i[edit update destroy toggle_active]

  def index
    @q = Coupon.includes(:orders).ransack(params[:q])
    @pagy, @coupons = pagy(@q.result.ordered, items: 20)
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to admin_coupons_path(locale: I18n.locale), notice: t("admin.coupons.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @coupon.update(coupon_params)
      redirect_to admin_coupons_path(locale: I18n.locale), notice: t("admin.coupons.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @coupon.destroy
    redirect_to admin_coupons_path(locale: I18n.locale), notice: t("admin.coupons.deleted")
  end

  def toggle_active
    @coupon.update(active: !@coupon.active)
    redirect_to admin_coupons_path(locale: I18n.locale), notice: t("admin.coupons.updated")
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def coupon_params
    params.require(:coupon).permit(
      :code,
      :discount_type,
      :discount_value,
      :active,
      :valid_from,
      :valid_until,
      :single_use_per_user,
      :usage_limit,
      :min_order_amount
    )
  end
end
