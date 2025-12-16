# frozen_string_literal: true

require "net/http"
require "json"

module Dhl
  class Client
    class Error < StandardError; end
    class AuthenticationError < Error; end
    class RequestError < Error; end

    # DHL Express API URLs
    BASE_URL = "https://express.api.dhl.com/mydhlapi"
    TRACKING_BASE_URL = "https://api-eu.dhl.com"

    attr_accessor :api_key, :api_secret, :account_number

    def initialize(api_key: nil, api_secret: nil, account_number: nil)
      @api_key = api_key || ENV["DHL_EXPRESS_API_KEY"]
      @api_secret = api_secret || ENV["DHL_EXPRESS_API_SECRET"]
      @account_number = account_number || ENV["DHL_EXPRESS_ACCOUNT_NUMBER"]
    end

    # Resource accessors
    def shipments
      @shipments ||= Resources::Shipments.new(self)
    end

    def labels
      @labels ||= Resources::Labels.new(self)
    end

    def tracking
      @tracking ||= Resources::Tracking.new(self)
    end

    def service_points
      @service_points ||= Resources::ServicePoints.new(self)
    end

    # HTTP request method
    def request(method, path, body: nil, headers: {}, base_url: BASE_URL)
      validate_credentials!

      uri = URI.join(base_url, path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.read_timeout = 30

      request_class = case method.to_s.upcase
                      when "GET" then Net::HTTP::Get
                      when "POST" then Net::HTTP::Post
                      when "PUT" then Net::HTTP::Put
                      when "PATCH" then Net::HTTP::Patch
                      when "DELETE" then Net::HTTP::Delete
                      else raise ArgumentError, "Unsupported HTTP method: #{method}"
                      end

      request = request_class.new(uri.request_uri)
      request["Accept"] = "application/json"
      request["Authorization"] = "Basic #{auth_token}"

      if body
        request["Content-Type"] = "application/json"
        request.body = body.to_json
      end

      headers.each { |key, value| request[key] = value }

      response = http.request(request)
      handle_response(response)
    rescue StandardError => e
      raise RequestError, "DHL Express API request failed: #{e.message}"
    end

    private

    def validate_credentials!
      raise AuthenticationError, "DHL Express API Key is required" if api_key.blank?
      raise AuthenticationError, "DHL Express API Secret is required" if api_secret.blank?
    end

    def auth_token
      Base64.strict_encode64("#{api_key}:#{api_secret}")
    end

    def handle_response(response)
      case response.code.to_i
      when 200..299
        response.body.present? ? JSON.parse(response.body) : {}
      when 401
        raise AuthenticationError, "Invalid DHL Express credentials - check API key and secret"
      when 400..499
        error_message = parse_error_message(response.body)
        raise RequestError, "Client error (#{response.code}): #{error_message}"
      when 500..599
        raise RequestError, "DHL Express server error (#{response.code})"
      else
        raise RequestError, "Unexpected response (#{response.code})"
      end
    end

    def parse_error_message(body)
      return body if body.blank?

      parsed = JSON.parse(body)
      parsed["message"] || parsed["error"] || body
    rescue JSON::ParserError
      body
    end
  end
end
