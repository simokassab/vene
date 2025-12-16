# frozen_string_literal: true

# DHL Parcel API Usage Examples
# This file demonstrates all the features of the DHL integration

module DhlExamples
  # Example 1: Configure default sender (do this in config/initializers/dhl.rb)
  def self.configure_sender
    Dhl.configure do |config|
      config.default_sender = Dhl::Recipient.new(
        name: "Vene Jewelry",
        company_name: "Vene Jewelry",
        street: "Jewelry Street",
        number: "123",
        postal_code: "1012AB",
        city: "Amsterdam",
        country_code: "NL",
        email: "shipping@venejewelry.com",
        phone: "+31612345678"
      )
    end
  end

  # Example 2: Create a shipment from an order (simplest way)
  def self.create_shipment_from_order(order_id)
    order = Order.find(order_id)

    # Create shipment with default settings
    shipment = order.create_dhl_shipment

    puts "Shipment created successfully!"
    puts "Tracking Number: #{shipment.tracking_number}"
    puts "Label ID: #{shipment.label_id}"
    puts "Barcode: #{shipment.barcode}"

    shipment
  rescue Dhl::Client::Error => e
    puts "Error creating shipment: #{e.message}"
    nil
  end

  # Example 3: Create a shipment with custom options
  def self.create_shipment_with_options(order_id)
    order = Order.find(order_id)

    # Configure shipment options
    options = Dhl::ShipmentOptions.new(
      description: "Precious Jewelry - Handle with Care",
      signature_required: true,
      evening_delivery: false,
      mailbox_package: false,
      extra_assurance: 1000.00  # €1000 extra insurance
    )

    # Create shipment
    shipment = order.create_dhl_shipment(options: options)

    puts "Shipment created with signature requirement and extra insurance"
    shipment
  end

  # Example 4: Manual shipment creation
  def self.create_manual_shipment
    client = Dhl.client

    # Create recipient
    recipient = Dhl::Recipient.new(
      name: "Jane Smith",
      street: "Keizersgracht",
      number: "555",
      postal_code: "1017DR",
      city: "Amsterdam",
      country_code: "NL",
      email: "jane@example.com",
      phone: "+31698765432"
    )

    # Create parcel
    parcel = Dhl::Parcel.new(
      recipient: recipient,
      sender: Dhl.default_sender,
      reference_identifier: "MANUAL-#{Time.current.to_i}"
    )

    # Add package (500 grams)
    parcel.add_piece(weight: 500)

    # Create shipment
    shipment = client.shipments.create(parcel)

    puts "Manual shipment created!"
    puts "Tracking: #{shipment.tracking_number}"

    shipment
  end

  # Example 5: Track a shipment
  def self.track_shipment(order_id)
    order = Order.find(order_id)

    unless order.has_dhl_tracking?
      puts "Order #{order_id} doesn't have DHL tracking yet"
      return nil
    end

    tracking_info = order.dhl_tracking_info

    if tracking_info
      puts "=" * 50
      puts "Tracking Information for Order ##{order.id}"
      puts "=" * 50
      puts "Tracking Number: #{tracking_info.barcode}"
      puts "Status: #{tracking_info.status_description}"
      puts "Delivered: #{tracking_info.delivered ? 'Yes' : 'No'}"
      puts "Estimated Delivery: #{tracking_info.estimated_delivery}"
      puts "\nTracking Events:"
      puts "-" * 50

      tracking_info.events.each do |event|
        puts "#{event.formatted_time} - #{event.description}"
        puts "  Location: #{event.location}" if event.location.present?
      end
    else
      puts "Could not retrieve tracking information"
    end

    tracking_info
  end

  # Example 6: Download shipping label
  def self.download_label(order_id, output_path = nil)
    order = Order.find(order_id)

    unless order.has_dhl_tracking?
      puts "Order #{order_id} doesn't have DHL tracking yet"
      return false
    end

    label_pdf = order.dhl_label_pdf

    if label_pdf
      output_path ||= Rails.root.join("tmp", "label_#{order.id}.pdf")

      File.open(output_path, "wb") do |file|
        file.write(label_pdf)
      end

      puts "Label saved to: #{output_path}"
      true
    else
      puts "Could not retrieve label"
      false
    end
  end

  # Example 7: Find nearby service points
  def self.find_service_points(postal_code, country_code = "NL")
    client = Dhl.client

    service_points = client.service_points.search(
      postal_code: postal_code,
      country_code: country_code,
      limit: 5
    )

    puts "=" * 50
    puts "Service Points near #{postal_code}"
    puts "=" * 50

    service_points.each_with_index do |sp, index|
      puts "\n#{index + 1}. #{sp.name}"
      puts "   #{sp.full_address}"
      puts "   Distance: #{sp.distance_km} km"
      puts "   ID: #{sp.id}"
    end

    service_points
  rescue Dhl::Client::Error => e
    puts "Error finding service points: #{e.message}"
    []
  end

  # Example 8: Create shipment to a service point
  def self.create_service_point_shipment(order_id, service_point_id)
    order = Order.find(order_id)

    options = Dhl::ShipmentOptions.new(
      service_point_id: service_point_id,
      description: "Pickup at service point"
    )

    shipment = order.create_dhl_shipment(options: options)

    puts "Shipment created for pickup at service point #{service_point_id}"
    shipment
  end

  # Example 9: Bulk create shipments for paid orders
  def self.bulk_create_shipments
    # Find all paid orders without tracking
    orders = Order.where(payment_status: "paid", dhl_tracking_id: nil)
                  .where.not(status: %w[canceled delivered])

    puts "Creating shipments for #{orders.count} orders..."

    results = { success: [], failed: [] }

    orders.find_each do |order|
      begin
        shipment = order.create_dhl_shipment
        order.update!(status: "shipped")

        results[:success] << order.id
        puts "✓ Order #{order.id}: #{shipment.tracking_number}"
      rescue Dhl::Client::Error => e
        results[:failed] << { order_id: order.id, error: e.message }
        puts "✗ Order #{order.id}: #{e.message}"
      end

      # Rate limiting - pause between requests
      sleep(0.5)
    end

    puts "\nResults:"
    puts "Success: #{results[:success].count}"
    puts "Failed: #{results[:failed].count}"

    results
  end

  # Example 10: Check delivery status for all shipped orders
  def self.check_all_deliveries
    orders = Order.where(status: "shipped").where.not(dhl_tracking_id: nil)

    puts "Checking #{orders.count} shipped orders..."

    orders.find_each do |order|
      tracking_info = order.dhl_tracking_info

      if tracking_info&.delivered
        order.update!(status: "delivered")
        puts "✓ Order #{order.id} delivered"
      elsif tracking_info
        puts "  Order #{order.id}: #{tracking_info.status_description}"
      else
        puts "✗ Order #{order.id}: Could not get tracking info"
      end

      # Rate limiting
      sleep(0.5)
    end
  end
end

# Console examples:
# Run these in `bin/rails console`

# Configure sender (run once)
# DhlExamples.configure_sender

# Create a shipment
# DhlExamples.create_shipment_from_order(1)

# Create with options
# DhlExamples.create_shipment_with_options(1)

# Track a shipment
# DhlExamples.track_shipment(1)

# Download label
# DhlExamples.download_label(1)

# Find service points
# DhlExamples.find_service_points("1012AB", "NL")

# Bulk operations
# DhlExamples.bulk_create_shipments
# DhlExamples.check_all_deliveries
