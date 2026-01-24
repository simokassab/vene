require "digest"

module Montypay
  class WebhookVerifier
    def initialize(params, settings: Setting.current)
      @params = params
      @settings = settings
    end

    def valid?
      return false if @params[:hash].blank?
      return false if @settings.montypay_api_key.blank?

      expected_hash = generate_expected_hash
      ActiveSupport::SecurityUtils.secure_compare(expected_hash, @params[:hash].to_s)
    end

    private

    def generate_expected_hash
      # hash = SHA1(MD5(payment_id + order_number + amount + currency + description + password).uppercase)
      to_md5 = [
        @params[:id],
        @params[:order_number],
        @params[:order_amount],
        @params[:order_currency],
        @params[:order_description],
        @settings.montypay_api_key
      ].join.upcase

      md5 = Digest::MD5.hexdigest(to_md5)
      Digest::SHA1.hexdigest(md5)
    end
  end
end
