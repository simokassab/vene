class Admin::SettingsController < Admin::BaseController
  def show
    @setting = Setting.current
  end

  def update
    @setting = Setting.current
    if @setting.update(setting_params)
      redirect_to admin_setting_path(locale: I18n.locale), notice: t("admin.settings.updated")
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:store_name, :local_tax_rate, :international_tax_rate, :shipping_flat_rate,
                                    :default_currency, :whatsapp_phone_number, :local_country, :montypay_merchant_id,
                                    :montypay_api_key, :preorder_enabled, :preorder_default_delivery_days,
                                    :preorder_disclaimer_en, :preorder_disclaimer_ar, :maintenance_mode)
  end
end
