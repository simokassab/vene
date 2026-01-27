# frozen_string_literal: true

namespace :dhl do
  desc "Test DHL Express API connection with sandbox credentials"
  task test_connection: :environment do
    puts "Testing DHL Express API connection..."
    puts "Test Mode: #{ENV['DHL_EXPRESS_TEST_MODE']}"
    puts "API Key: #{ENV['DHL_EXPRESS_API_KEY']&.first(6)}..."
    puts "Account: #{ENV['DHL_EXPRESS_ACCOUNT_NUMBER']}"
    puts ""

    client = Dhl.client
    puts "Base URL: #{client.default_base_url}"
    puts ""

    # Try a simple rates request to verify credentials work
    begin
      response = client.request(:get, "/rates?accountNumber=#{ENV['DHL_EXPRESS_ACCOUNT_NUMBER']}&originCountryCode=LB&originCityName=Beirut&destinationCountryCode=AE&destinationCityName=Dubai&weight=0.5&length=15&width=10&height=5&plannedShippingDate=#{Date.tomorrow.strftime('%Y-%m-%d')}&isCustomsDeclarable=false&unitOfMeasurement=metric")
      puts "Connection successful!"
      puts "Response contains #{response['products']&.length || 0} product(s)"
      response["products"]&.each do |product|
        puts "  - #{product['productName']}: #{product.dig('totalPrice', 0, 'price')} #{product.dig('totalPrice', 0, 'priceCurrency')}"
      end
    rescue Dhl::Client::AuthenticationError => e
      puts "Authentication FAILED: #{e.message}"
      puts "Check your DHL_EXPRESS_API_KEY and DHL_EXPRESS_API_SECRET"
    rescue Dhl::Client::RequestError => e
      puts "Request error: #{e.message}"
      puts "Credentials may be valid but the request format needs adjustment."
    end
  end

  desc "Test DHL Express shipping rates for an order"
  task :test_rates, [:order_id] => :environment do |_t, args|
    order_id = args[:order_id]
    unless order_id
      puts "Usage: rake dhl:test_rates[ORDER_ID]"
      exit 1
    end

    order = Order.find(order_id)
    puts "Getting DHL rates for Order ##{order.id}..."
    puts "Destination: #{order.city}, #{order.country}"
    puts ""

    rates = order.get_dhl_shipping_rates

    if rates.any?
      puts "Found #{rates.length} rate(s):"
      rates.each do |rate|
        price_info = rate.dig("totalPrice", 0)
        puts "  - #{rate['productName']} (#{rate['productCode']}): #{price_info&.dig('price')} #{price_info&.dig('priceCurrency')}"
        puts "    Delivery: #{rate.dig('deliveryCapabilities', 'estimatedDeliveryDateAndTime')}"
      end
    else
      puts "No rates found. Check order address and DHL configuration."
    end
  rescue ActiveRecord::RecordNotFound
    puts "Order ##{order_id} not found."
  rescue => e
    puts "Error: #{e.message}"
  end

  desc "Test creating a DHL Express shipment for an order (sandbox mode)"
  task :test_shipment, [:order_id] => :environment do |_t, args|
    order_id = args[:order_id]
    unless order_id
      puts "Usage: rake dhl:test_shipment[ORDER_ID]"
      exit 1
    end

    unless ENV["DHL_EXPRESS_TEST_MODE"] == "true"
      puts "WARNING: Test mode is not enabled! Set DHL_EXPRESS_TEST_MODE=true"
      puts "Aborting to prevent creating a real shipment."
      exit 1
    end

    order = Order.find(order_id)
    puts "Creating test DHL shipment for Order ##{order.id}..."
    puts "Customer: #{order.name}"
    puts "Destination: #{order.address}, #{order.city}, #{order.country}"
    puts ""

    shipment = order.create_dhl_shipment

    if shipment.success?
      puts "Shipment created successfully!"
      puts "  Tracking Number: #{shipment.tracking_number}"
      puts "  All Tracking Numbers: #{shipment.all_tracking_numbers.join(', ')}"
      puts "  Total Charge: #{shipment.total_charge} #{shipment.currency}"
      puts "  Label available: #{shipment.label_content.present? ? 'Yes' : 'No'}"
      puts ""
      puts "Order updated with tracking ID: #{order.reload.dhl_tracking_id}"
    else
      puts "Shipment creation failed - no tracking number returned."
    end
  rescue ActiveRecord::RecordNotFound
    puts "Order ##{order_id} not found."
  rescue Dhl::Client::Error => e
    puts "DHL Error: #{e.message}"
  rescue => e
    puts "Error: #{e.class} - #{e.message}"
  end
end
