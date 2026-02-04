require "net/http"
require "json"
require "digest"

module Montypay
  class Client
    API_URL = "https://checkout.montypay.com/api/v1/session".freeze

    Result = Data.define(:success?, :redirect_url, :error)

    def initialize(order, settings: Setting.current)
      @order = order
      @settings = settings
    end

    def start_payment
      response = create_session

      if response[:redirect_url]
        Result.new(true, response[:redirect_url], nil)
      else
        error_message = response[:error_message] || response[:message] || "Payment initialization failed"
        Rails.logger.error("MontyPay session creation failed: #{error_message}")
        Result.new(false, nil, error_message)
      end
    rescue StandardError => e
      Rails.logger.error("MontyPay Error: #{e.class} - #{e.message}")
      Result.new(false, nil, e.message)
    end

    private

    def create_session
      uri = URI(API_URL)
      request = Net::HTTP::Post.new(uri)
      request["Content-Type"] = "application/json"
      request.body = payload.to_json

      Rails.logger.info("MontyPay request payload: #{payload.except(:hash).to_json}")

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      Rails.logger.info("MontyPay response: #{response.code} - #{response.body}")

      JSON.parse(response.body, symbolize_names: true)
    end

    def payload
      {
        merchant_key: @settings.montypay_merchant_id,
        operation: "purchase",
        order: order_data,
        success_url: success_url,
        cancel_url: cancel_url,
        callback_url: webhook_url,
        customer: customer_data,
        billing_address: billing_address_data,
        hash: generate_hash
      }
    end

    def order_data
      {
        number: @order.id.to_s,
        amount: format_amount(@order.total_amount),
        currency: @order.currency,
        description: "Order ##{@order.id} - VENE Jewelry"
      }
    end

    def format_amount(amount)
      if ExchangeRateService.three_decimal?(@order.currency)
        format("%.3f", amount)
      else
        format("%.2f", amount)
      end
    end

    def generate_hash
      # SHA1(MD5(order_number + amount + currency + description + password).uppercase)
      order = order_data
      to_md5 = "#{order[:number]}#{order[:amount]}#{order[:currency]}#{order[:description]}#{@settings.montypay_api_key}"
      md5 = Digest::MD5.hexdigest(to_md5.upcase)
      Digest::SHA1.hexdigest(md5)
    end

    def success_url
      Rails.application.routes.url_helpers.success_storefront_payments_url(
        { order_id: @order.id }.merge(url_options)
      )
    end

    def cancel_url
      Rails.application.routes.url_helpers.failure_storefront_payments_url(
        { order_id: @order.id }.merge(url_options)
      )
    end

    def webhook_url
      Rails.application.routes.url_helpers.webhook_storefront_payments_url(url_options)
    end

    def url_options
      Rails.application.routes.default_url_options.presence ||
        Rails.application.config.action_mailer.default_url_options ||
        { host: "localhost", port: 3000, protocol: "http" }
    end

    def customer_data
      {
        name: @order.name,
        email: @order.email
      }
    end

    def billing_address_data
      {
        country: @order.country,
        city: @order.city,
        address: @order.address_text,
        phone: @order.phone
      }
    end
  end
end
