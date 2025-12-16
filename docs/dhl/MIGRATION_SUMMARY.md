# DHL Integration - Migration Summary

## Overview

The DHL integration has been **rebuilt for DHL Express API** (MyDHL API) to support international shipping between Lebanon, Saudi Arabia, UAE, and other countries worldwide.

## What Changed

### From: DHL Parcel (European Regional)
- **Region**: Netherlands, Belgium, Luxembourg only
- **API**: `https://api-gw.dhlparcel.nl`
- **Auth**: User ID + API Key

### To: DHL Express (International/Worldwide)
- **Region**: Worldwide, including Middle East (Lebanon, Saudi Arabia, UAE)
- **API**: `https://express.api.dhl.com/mydhlapi`
- **Auth**: API Key + API Secret (Basic Auth)

## File Changes

### New Files Created
1. `app/services/dhl/address.rb` - Address model (replaces old Recipient for address only)
2. `app/services/dhl/contact.rb` - Contact information model
3. `app/services/dhl/package.rb` - Package details model
4. `app/services/dhl/shipment_request.rb` - Main shipment request builder

### Modified Files
1. `app/services/dhl/client.rb` - Updated for Express API authentication
2. `app/services/dhl/shipment.rb` - Updated for Express response format
3. `app/services/dhl/tracking_info.rb` - Updated for unified tracking API
4. `app/services/dhl/resources/shipments.rb` - Updated endpoints
5. `app/services/dhl/resources/tracking.rb` - Updated to use unified tracking API
6. `app/services/dhl/resources/labels.rb` - Updated for Express label format
7. `app/services/dhl/resources/service_points.rb` - Now returns NotImplementedError (not available in Express)
8. `app/models/order.rb` - Updated integration methods
9. `config/initializers/dhl.rb` - New configuration format
10. `.env.example` - New environment variables

### Deprecated Files (No longer used with Express API)
- `app/services/dhl/recipient.rb` - Replaced by Address + Contact
- `app/services/dhl/shipment_options.rb` - Options now embedded in ShipmentRequest
- `app/services/dhl/parcel.rb` - Replaced by ShipmentRequest
- `app/services/dhl/service_point.rb` - Not available in Express API

## API Differences

| Feature | DHL Parcel | DHL Express |
|---------|------------|-------------|
| **Authentication** | Basic Auth (UserID:APIKey) | Basic Auth (APIKey:APISecret) |
| **Base URL** | api-gw.dhlparcel.nl | express.api.dhl.com/mydhlapi |
| **Tracking** | /track-trace/{number} | api-eu.dhl.com/track/shipments |
| **Service Points** | ✅ Available | ❌ Not available |
| **Weight Unit** | Grams | Kilograms |
| **Dimensions Unit** | Not specified | Centimeters |
| **Label Format** | Direct PDF | Base64-encoded PDF |
| **Rate Shopping** | ❌ Not implemented | ✅ Available |

## Environment Variables

### Old (DHL Parcel)
```bash
DHL_USER_ID=...
DHL_API_KEY=...
DHL_ACCOUNT_ID=...
```

### New (DHL Express)
```bash
DHL_EXPRESS_API_KEY=...
DHL_EXPRESS_API_SECRET=...
DHL_EXPRESS_ACCOUNT_NUMBER=...
```

## Configuration Changes

### Old Configuration
```ruby
Dhl.configure do |config|
  config.default_sender = Dhl::Recipient.new(...)
end
```

### New Configuration
```ruby
Dhl.configure do |config|
  config.default_shipper_address = Dhl::Address.new(...)
  config.default_shipper_contact = Dhl::Contact.new(...)
end
```

## Order Model Integration

### Method Signatures Changed

**Old:**
```ruby
order.create_dhl_shipment(sender: Dhl::Recipient, options: Dhl::ShipmentOptions)
```

**New:**
```ruby
order.create_dhl_shipment(
  shipper_address: Dhl::Address,
  shipper_contact: Dhl::Contact,
  account_number: String
)
```

### New Methods Added
```ruby
order.get_dhl_shipping_rates  # Get rates before creating shipment
```

## Data Model Changes

### Shipment Creation

**Old (DHL Parcel):**
```ruby
parcel = Dhl::Parcel.new(recipient: ..., sender: ...)
parcel.add_piece(weight: 500)  # grams
shipment = client.shipments.create(parcel)
```

**New (DHL Express):**
```ruby
request = Dhl::ShipmentRequest.new
request.with_shipper(address: ..., contact: ...)
request.with_receiver(address: ..., contact: ...)
request.add_package(Dhl::Package.new(weight: 0.5))  # KG
shipment = client.shipments.create(request)
```

### Shipment Response

**Old:**
- `shipment.barcode` - Tracking number
- `shipment.label_id` - Label ID
- `shipment.tracking_number` - Alias for barcode

**New:**
- `shipment.shipment_tracking_number` - Main tracking
- `shipment.tracking_numbers` - Array of all tracking numbers
- `shipment.label_content` - Base64 label
- `shipment.label_binary` - Decoded binary PDF
- `shipment.total_charge` - Shipping cost
- `shipment.currency` - Currency code

### Tracking Information

**Old:**
- `tracking.barcode`
- `tracking.status`
- `tracking.delivered` - Boolean

**New:**
- `tracking.tracking_number`
- `tracking.status`
- `tracking.delivered?` - Method
- `tracking.origin` - Origin location
- `tracking.destination` - Destination location

## Migration Steps for Existing Code

If you have existing code using the old DHL Parcel integration:

1. **Update environment variables** in `.env`
2. **Update configuration** in `config/initializers/dhl.rb`
3. **Replace Recipient with Address + Contact**:
   ```ruby
   # Old
   recipient = Dhl::Recipient.new(name: "John", street: "Main St", ...)

   # New
   address = Dhl::Address.new(city_name: "City", address_line1: "Main St", ...)
   contact = Dhl::Contact.new(full_name: "John", ...)
   ```

4. **Replace Parcel with ShipmentRequest**:
   ```ruby
   # Old
   parcel = Dhl::Parcel.from_order(order, sender: ...)

   # New
   request = Dhl::ShipmentRequest.from_order(order,
     shipper_address: ...,
     shipper_contact: ...,
     account_number: ...
   )
   ```

5. **Update weight units** from grams to kilograms:
   ```ruby
   # Old: 500 grams
   parcel.add_piece(weight: 500)

   # New: 0.5 KG
   request.add_package(Dhl::Package.new(weight: 0.5))
   ```

6. **Update label handling**:
   ```ruby
   # Old
   label_pdf = client.labels.get(label_id)

   # New
   label_pdf = shipment.label_binary  # Available immediately after creation
   ```

## Testing Checklist

- [ ] Set DHL Express environment variables
- [ ] Configure shipper address and contact in initializer
- [ ] Restart Rails server
- [ ] Test client creation: `Dhl.client`
- [ ] Test configuration: `Dhl.default_shipper_address`
- [ ] Create test shipment with sandbox credentials
- [ ] Track test shipment
- [ ] Download label from test shipment

## Country Code Reference

Updated for Middle East:

- **LB** - Lebanon
- **SA** - Saudi Arabia
- **AE** - United Arab Emirates
- **EG** - Egypt
- **JO** - Jordan
- **KW** - Kuwait
- **BH** - Bahrain
- **OM** - Oman
- **QA** - Qatar

## Support Resources

- **API Documentation**: https://developer.dhl.com/api-reference/mydhl-api-dhl-express
- **Developer Portal**: https://developer.dhl.com/
- **Tracking API**: https://developer.dhl.com/api-reference/shipment-tracking
- **Credentials Guide**: https://support.shipandco.com/hc/en-us/articles/38801071543449

## Questions?

See the main `README.md` for complete documentation and examples.
