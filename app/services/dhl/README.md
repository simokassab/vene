# DHL Express API Integration

This directory contains a Ruby implementation of the **DHL Express MyDHL API** for international shipping between Lebanon, Saudi Arabia, UAE, and other countries worldwide.

## Features

- **Shipment Creation**: Create DHL Express international shipments
- **Label Generation**: Retrieve shipping labels as PDF (base64 encoded)
- **Tracking**: Get real-time tracking information for shipments
- **Rate Shopping**: Get shipping rates before creating shipments
- **Order Integration**: Seamless integration with Rails Order model

## Setup

### 1. Get DHL Express API Credentials

1. **Register on DHL Developer Portal**:
   - Go to [https://developer.dhl.com/](https://developer.dhl.com/)
   - Click "Register" and create an account

2. **Request API Access**:
   - Log in and go to "Get Access"
   - Select "DHL Express - MyDHL API"
   - Enter your 9-digit DHL Express Account Number
   - Provide company details and estimated volume

3. **Receive Credentials**:
   - You'll get two emails (usually next business day):
     - Test Access Approved (sandbox credentials)
     - Production Access Approved (live credentials)
   - In the portal, click your company name and "Show Key" to reveal:
     - **API Key**
     - **API Secret**

### 2. Environment Variables

Add your DHL Express credentials to your `.env` file:

```bash
DHL_EXPRESS_API_KEY=your_api_key_here
DHL_EXPRESS_API_SECRET=your_api_secret_here
DHL_EXPRESS_ACCOUNT_NUMBER=your_9_digit_account_number
```

### 3. Configure Default Shipper

**REQUIRED**: Edit `config/initializers/dhl.rb` to set your shipper information:

```ruby
Dhl.configure do |config|
  # Shipper Address
  config.default_shipper_address = Dhl::Address.new(
    city_name: "Beirut",
    country_code: "LB",  # LB=Lebanon, SA=Saudi Arabia, AE=UAE
    postal_code: "1234",
    address_line1: "Your Street Name, Building Number",
    country_name: "Lebanon"
  )

  # Shipper Contact
  config.default_shipper_contact = Dhl::Contact.new(
    full_name: "Vene Jewelry",
    company_name: "Vene Jewelry",
    phone: "+961-X-XXXXXX",  # Include country code
    email: "shipping@venejewelry.com"
  )
end
```

## Usage Examples

### Creating a Shipment from an Order

The easiest way is to use the Order model integration:

```ruby
order = Order.find(123)

# Create shipment with default shipper
shipment = order.create_dhl_shipment

puts "Tracking Number: #{shipment.tracking_number}"
puts "Label: #{shipment.label_binary ? 'Available' : 'Not available'}"
puts "Total Charge: #{shipment.total_charge} #{shipment.currency}"
```

### Manual Shipment Creation

```ruby
# Initialize client
client = Dhl.client

# Create receiver address
receiver_address = Dhl::Address.new(
  city_name: "Riyadh",
  country_code: "SA",  # Saudi Arabia
  postal_code: "11564",
  address_line1: "King Fahd Road, Building 456",
  country_name: "Saudi Arabia"
)

# Create receiver contact
receiver_contact = Dhl::Contact.new(
  full_name: "Ahmed Al-Saud",
  company_name: "Ahmed Al-Saud",
  phone: "+966-XX-XXXXXXX",
  email: "ahmed@example.com"
)

# Create shipment request
shipment_request = Dhl::ShipmentRequest.new(
  product_code: "P",  # DHL Express Worldwide
  content_description: "Jewelry Items"
)

# Set shipper and receiver
shipment_request.with_shipper(
  address: Dhl.default_shipper_address,
  contact: Dhl.default_shipper_contact
)

shipment_request.with_receiver(
  address: receiver_address,
  contact: receiver_contact
)

# Add package (weight in KG, dimensions in CM)
package = Dhl::Package.new(
  weight: 0.5,  # 500 grams
  length: 20,
  width: 15,
  height: 10
)
shipment_request.add_package(package)

# Set account
shipment_request.with_account(ENV["DHL_EXPRESS_ACCOUNT_NUMBER"])

# Create the shipment
shipment = client.shipments.create(shipment_request)

puts "Shipment created!"
puts "Tracking Number: #{shipment.tracking_number}"

# Save label to file
if shipment.label_binary
  File.open("label_#{shipment.tracking_number}.pdf", "wb") do |file|
    file.write(shipment.label_binary)
  end
end
```

### Tracking a Shipment

```ruby
# From an order
order = Order.find(123)
tracking_info = order.dhl_tracking_info

if tracking_info
  puts "Status: #{tracking_info.status_description}"
  puts "Origin: #{tracking_info.origin}"
  puts "Destination: #{tracking_info.destination}"
  puts "Delivered: #{tracking_info.delivered?}"
  puts "Estimated Delivery: #{tracking_info.estimated_delivery}"

  puts "\nTracking Events:"
  tracking_info.events.each do |event|
    puts "#{event.formatted_time} - #{event.description} (#{event.location})"
  end
end

# Or directly with tracking number
client = Dhl.client
tracking_info = client.tracking.get("1234567890")
```

### Getting Shipping Rates

```ruby
# From an order (before creating shipment)
order = Order.find(123)
rates = order.get_dhl_shipping_rates

rates.each do |rate|
  puts "Service: #{rate['productName']}"
  puts "Price: #{rate.dig('totalPrice', 0, 'price')} #{rate.dig('totalPrice', 0, 'currencyType')}"
  puts "Delivery Time: #{rate['deliveryCapabilities']['deliveryTypeCode']}"
  puts "---"
end
```

## Data Models

### Dhl::Address

Represents a shipping address:

```ruby
address = Dhl::Address.new(
  city_name: "Dubai",              # Required
  country_code: "AE",              # Required (ISO 2-letter)
  postal_code: "12345",            # Required
  address_line1: "Sheikh Zayed Road, Tower 3",  # Required
  address_line2: "Floor 15",       # Optional
  address_line3: nil,              # Optional
  country_name: "United Arab Emirates"  # Optional
)
```

### Dhl::Contact

Represents contact information:

```ruby
contact = Dhl::Contact.new(
  full_name: "John Doe",           # Required
  company_name: "ACME Inc",        # Required
  phone: "+971-XX-XXXXXXX",        # Required (with country code)
  email: "john@example.com"        # Optional
)
```

### Dhl::Package

Represents a package:

```ruby
package = Dhl::Package.new(
  weight: 1.5,         # Required (in KG)
  length: 30,          # Optional (in CM)
  width: 20,           # Optional (in CM)
  height: 15,          # Optional (in CM)
  customer_references: "REF123"  # Optional
)
```

### Dhl::ShipmentRequest

The main shipment creation object:

```ruby
request = Dhl::ShipmentRequest.new(
  product_code: "P",               # DHL Express service code
  content_description: "Electronics",
  incoterm: "DAP",                 # Delivered At Place
  is_customs_declarable: true
)

request.with_shipper(address: shipper_addr, contact: shipper_contact)
request.with_receiver(address: receiver_addr, contact: receiver_contact)
request.add_package(package)
request.with_account(account_number)
```

## DHL Express Service Codes

Common product codes for Middle East shipping:

- **P** - DHL Express Worldwide (most common)
- **N** - DHL Express 12:00
- **T** - DHL Express 9:00
- **Y** - DHL Express Economy Select

## Country Codes

Common country codes for Middle East:

- **LB** - Lebanon
- **SA** - Saudi Arabia
- **AE** - United Arab Emirates
- **EG** - Egypt
- **JO** - Jordan
- **KW** - Kuwait
- **BH** - Bahrain
- **OM** - Oman
- **QA** - Qatar

## Order Model Integration

The `Order` model has been enhanced with DHL Express methods:

```ruby
# Create shipment
shipment = order.create_dhl_shipment

# Get tracking
tracking = order.dhl_tracking_info

# Get label (if stored)
label_pdf = order.dhl_label_pdf

# Check tracking status
order.has_dhl_tracking?  # => true/false

# Get shipping rates
rates = order.get_dhl_shipping_rates
```

## Admin Integration Example

Add DHL shipping to your admin panel:

```ruby
# app/controllers/admin/orders_controller.rb
class Admin::OrdersController < Admin::BaseController
  def create_shipment
    @order = Order.find(params[:id])

    begin
      shipment = @order.create_dhl_shipment

      # Save label to file or ActiveStorage
      if shipment.label_binary
        File.open(Rails.root.join("tmp", "label_#{@order.id}.pdf"), "wb") do |file|
          file.write(shipment.label_binary)
        end
      end

      @order.update!(status: 'shipped')

      redirect_to admin_order_path(@order),
        notice: "Shipment created! Tracking: #{shipment.tracking_number}"
    rescue Dhl::Client::Error => e
      redirect_to admin_order_path(@order),
        alert: "Failed to create shipment: #{e.message}"
    end
  end

  def download_label
    @order = Order.find(params[:id])
    label_pdf = @order.dhl_label_pdf

    if label_pdf
      send_data label_pdf,
        filename: "shipping_label_#{@order.id}.pdf",
        type: "application/pdf",
        disposition: "attachment"
    else
      redirect_to admin_order_path(@order),
        alert: "No label available"
    end
  end

  def track_shipment
    @order = Order.find(params[:id])
    @tracking = @order.dhl_tracking_info
  end
end
```

## Error Handling

The service raises the following exceptions:

- `Dhl::Client::Error` - Base error class
- `Dhl::Client::AuthenticationError` - Invalid credentials (401)
- `Dhl::Client::RequestError` - API request failed (4xx, 5xx)

Always wrap DHL calls in begin/rescue blocks:

```ruby
begin
  shipment = order.create_dhl_shipment
rescue Dhl::Client::AuthenticationError => e
  # Handle auth error - check API key and secret
  Rails.logger.error("DHL auth failed: #{e.message}")
rescue Dhl::Client::RequestError => e
  # Handle API error - check request format and data
  Rails.logger.error("DHL request failed: #{e.message}")
rescue Dhl::Client::Error => e
  # Handle other errors
  Rails.logger.error("DHL error: #{e.message}")
end
```

## Testing

Test your integration in the Rails console:

```ruby
# Test configuration
Dhl.default_shipper_address
# => Should show your shipper address

Dhl.default_shipper_contact
# => Should show your shipper contact

# Test client creation
client = Dhl.client
# => Should create client without errors

# Test with a real order (sandbox mode recommended)
order = Order.last
shipment = order.create_dhl_shipment
# => Creates actual shipment in DHL system
```

## Important Notes

- **API Endpoints**:
  - Main API: `https://express.api.dhl.com/mydhlapi`
  - Tracking API: `https://api-eu.dhl.com`
- **Authentication**: Basic Auth with Base64-encoded `API_KEY:API_SECRET`
- **Weights**: Always in KG (kilograms)
- **Dimensions**: Always in CM (centimeters)
- **Country Codes**: Must be ISO 2-letter codes (e.g., 'LB', 'SA', 'AE')
- **Phone Numbers**: Include country code (e.g., '+961-X-XXXXXX')
- **Labels**: Returned as base64-encoded PDF in shipment creation response
- **Production vs Sandbox**: Use separate credentials for testing and production

## Database Optimization

Following the requirement to optimize for 1M+ records:

- Tracking lookups use indexed `orders.dhl_tracking_id` column
- Bulk operations use `find_each` for batch processing
- API calls minimized through proper data preparation
- No N+1 queries in order integration

## Troubleshooting

### "Invalid DHL Express credentials"
- Verify your API Key and API Secret in `.env`
- Ensure you're using the correct credentials (test vs production)
- Check the DHL Developer Portal for active credentials

### "Shipper address is required"
- Uncomment and configure shipper details in `config/initializers/dhl.rb`
- Restart your Rails server after changing initializers

### "Account number is required"
- Set `DHL_EXPRESS_ACCOUNT_NUMBER` in your `.env` file
- This is your 9-digit DHL Express account number

### Rate limiting
- DHL Express may rate limit API calls
- Implement delays between bulk operations
- Consider using background jobs (Sidekiq) for shipment creation

## Resources

- [DHL Developer Portal](https://developer.dhl.com/)
- [MyDHL API Documentation](https://developer.dhl.com/api-reference/mydhl-api-dhl-express)
- [DHL Unified Tracking API](https://developer.dhl.com/api-reference/shipment-tracking)
- [Get API Credentials Guide](https://support.shipandco.com/hc/en-us/articles/38801071543449)

## Support

For API issues:
- Check the DHL Developer Portal documentation
- Contact your DHL Express account manager
- Email: api.support@dhl.com
