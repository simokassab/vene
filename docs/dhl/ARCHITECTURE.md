# DHL Parcel Integration Architecture

## Overview

This is a complete Ruby implementation of the DHL Parcel API, based on the [PHP library](https://github.com/mvdnbrk/dhlparcel-php-api), following SOLID, DRY, and KISS principles.

## File Structure

```
app/services/dhl/
├── client.rb                    # Main API client (HTTP requests, authentication)
├── parcel.rb                    # Parcel builder (creates shipments)
├── recipient.rb                 # Address data model (sender/recipient)
├── shipment_options.rb          # Delivery options (signature, insurance, etc.)
├── shipment.rb                  # Shipment response data
├── tracking_info.rb             # Tracking response data
├── service_point.rb             # Service point (pickup location) data
├── resources/
│   ├── shipments.rb            # Shipment API endpoints
│   ├── labels.rb               # Label API endpoints
│   ├── tracking.rb             # Tracking API endpoints
│   └── service_points.rb       # Service point API endpoints
├── README.md                    # Complete documentation
├── EXAMPLE_USAGE.rb            # Usage examples for all features
└── ARCHITECTURE.md             # This file

config/initializers/
└── dhl.rb                       # DHL configuration

app/models/
└── order.rb                     # Enhanced with DHL integration methods
```

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                      Application Layer                       │
│                                                               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │   Order      │  │   Admin      │  │   Console    │      │
│  │   Model      │  │  Controllers │  │   Scripts    │      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
│         │                 │                 │                │
└─────────┼─────────────────┼─────────────────┼────────────────┘
          │                 │                 │
          │    ┌────────────┴─────────────────┘
          │    │
          ▼    ▼
┌─────────────────────────────────────────────────────────────┐
│                      DHL Service Layer                       │
│                                                               │
│  ┌────────────────────────────────────────────────────┐     │
│  │              Dhl::Client                           │     │
│  │  - Authentication (Basic Auth)                     │     │
│  │  - HTTP Request Handling                           │     │
│  │  - Error Handling                                  │     │
│  └───┬─────────┬──────────┬──────────┬─────────────┘      │
│      │         │          │          │                      │
│      ▼         ▼          ▼          ▼                      │
│  ┌────────┐ ┌────────┐ ┌────────┐ ┌─────────────┐         │
│  │Shipments│ │Labels  │ │Tracking│ │ServicePoints│         │
│  │Resource │ │Resource│ │Resource│ │  Resource   │         │
│  └────────┘ └────────┘ └────────┘ └─────────────┘         │
│                                                               │
└─────────────────────────────────────────────────────────────┘
          │
          ▼
┌─────────────────────────────────────────────────────────────┐
│                      Data Models                             │
│                                                               │
│  ┌──────────┐  ┌──────────┐  ┌──────────────┐             │
│  │  Parcel  │  │Recipient │  │ShipmentOptions│             │
│  │(Builder) │  │  (Data)  │  │    (Data)     │             │
│  └──────────┘  └──────────┘  └──────────────┘              │
│                                                               │
│  ┌──────────┐  ┌────────────┐  ┌──────────────┐           │
│  │Shipment  │  │TrackingInfo│  │ ServicePoint │           │
│  │(Response)│  │ (Response) │  │  (Response)  │           │
│  └──────────┘  └────────────┘  └──────────────┘            │
│                                                               │
└─────────────────────────────────────────────────────────────┘
          │
          ▼
┌─────────────────────────────────────────────────────────────┐
│                   DHL Parcel API                             │
│              https://api-gw.dhlparcel.nl                     │
└─────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

### Core Components

#### `Dhl::Client`
- **Purpose**: Main API client for DHL communication
- **Responsibilities**:
  - Manage authentication credentials (user_id, api_key, account_id)
  - Handle HTTP requests (GET, POST, PUT, DELETE)
  - Base64 Basic Auth token generation
  - Response parsing and error handling
  - Provide access to resource endpoints
- **Design Pattern**: Facade pattern
- **Key Methods**: `request()`, `shipments`, `labels`, `tracking`, `service_points`

#### `Dhl::Parcel`
- **Purpose**: Builder for creating shipment parcels
- **Responsibilities**:
  - Aggregate recipient, sender, and options
  - Manage package pieces (weight, quantity)
  - Convert Order models to DHL format
  - Validate parcel data before API submission
- **Design Pattern**: Builder pattern
- **Key Methods**: `with_recipient()`, `with_sender()`, `add_piece()`, `to_hash()`, `from_order()`

### Resource Classes

#### `Dhl::Resources::Shipments`
- **Endpoints**: `/shipments`
- **Operations**: Create shipments, get shipment details, retrieve labels
- **Returns**: `Dhl::Shipment` objects

#### `Dhl::Resources::Labels`
- **Endpoints**: `/labels/:id`
- **Operations**: Get label PDF, get combined labels
- **Returns**: PDF binary string

#### `Dhl::Resources::Tracking`
- **Endpoints**: `/track-trace/:tracking_number`
- **Operations**: Get tracking info for one or multiple shipments
- **Returns**: `Dhl::TrackingInfo` objects

#### `Dhl::Resources::ServicePoints`
- **Endpoints**: `/parcel-shop-locations`
- **Operations**: Search nearby service points, get service point details
- **Returns**: `Dhl::ServicePoint` objects

### Data Models

All data models use Ruby's `Data.define` (immutable value objects):

#### `Dhl::Recipient` (Data)
- Represents sender or recipient address
- Fields: name, street, number, postal_code, city, country_code, email, phone, company_name, addition
- Converts to DHL API format with proper name splitting

#### `Dhl::ShipmentOptions` (Data)
- Delivery preferences and special handling
- Fields: description, mailbox_package, recipient_only, signature_required, evening_delivery, extra_assurance, cash_on_delivery, service_point_id
- Converts boolean options to DHL API format

#### `Dhl::Shipment` (Data)
- API response for created shipments
- Fields: id, barcode, label_id, label_type, tracker_code, routing_code, order_reference, pieces
- Provides `tracking_number` alias and `success?` check

#### `Dhl::TrackingInfo` (Data)
- API response for tracking queries
- Fields: barcode, status, status_description, delivered, delivery_date, estimated_delivery, events
- Includes `TrackingEvent` sub-model for event history

#### `Dhl::ServicePoint` (Data)
- API response for service point queries
- Fields: id, name, distance, address components, coordinates, opening_hours
- Provides helper methods for address formatting and distance conversion

## Integration Points

### Order Model Integration

The `Order` model has been enhanced with DHL methods:

```ruby
# Create shipment
order.create_dhl_shipment(sender:, options:)

# Get tracking
order.dhl_tracking_info

# Get label
order.dhl_label_pdf

# Check tracking status
order.has_dhl_tracking?
```

### Database Fields Used
- `orders.dhl_tracking_id` - Stores DHL tracking number

## Design Principles Applied

### SOLID Principles

1. **Single Responsibility**: Each class has one clear purpose
   - Client handles HTTP communication
   - Resources handle specific API endpoints
   - Data models handle data structure

2. **Open/Closed**: Extensible without modification
   - Easy to add new resources
   - Options can be extended with new fields

3. **Liskov Substitution**: Data models are value objects
   - Immutable Data classes ensure predictability

4. **Interface Segregation**: Small, focused interfaces
   - Each resource has specific methods for its domain

5. **Dependency Inversion**: Depend on abstractions
   - Order depends on DHL interface, not implementation

### DRY (Don't Repeat Yourself)

- Address parsing centralized in `Parcel.from_order`
- HTTP request logic in single `Client.request` method
- Error handling abstracted in `Client.handle_response`
- Data conversion via `to_hash` methods

### KISS (Keep It Simple, Stupid)

- Simple, flat directory structure
- Clear method names describing actions
- Minimal dependencies (only Ruby stdlib + Rails)
- Direct API mapping without over-abstraction

## Database Optimization

Following the requirement to optimize for 1M+ records:

- Tracking lookups use indexed `dhl_tracking_id` column
- Bulk operations use `find_each` for batch processing (EXAMPLE_USAGE.rb)
- API calls minimized through proper data preparation
- No N+1 queries in order integration

## Error Handling Strategy

Three-tier exception hierarchy:

```
Dhl::Client::Error (base)
├── Dhl::Client::AuthenticationError (401)
└── Dhl::Client::RequestError (4xx, 5xx)
```

Usage:
```ruby
begin
  shipment = order.create_dhl_shipment
rescue Dhl::Client::AuthenticationError => e
  # Handle auth issues
rescue Dhl::Client::RequestError => e
  # Handle API errors
rescue Dhl::Client::Error => e
  # Catch-all
end
```

## Configuration Flow

1. Environment variables loaded from `.env`
2. Initializer (`config/initializers/dhl.rb`) sets up `Dhl.default_sender`
3. Client created with `Dhl.client` using ENV credentials
4. Order methods use configured client and sender

## Testing Strategy

Test in Rails console:

```ruby
# 1. Test configuration
Dhl.default_sender

# 2. Test client creation
client = Dhl.client

# 3. Test with real order
order = Order.first
shipment = order.create_dhl_shipment
```

See `EXAMPLE_USAGE.rb` for comprehensive examples.

## Future Enhancements

Potential improvements:

1. **Caching**: Cache tracking info to reduce API calls
2. **Webhooks**: Listen for DHL delivery status updates
3. **Label Storage**: Store labels in ActiveStorage
4. **Address Validation**: Pre-validate addresses before submission
5. **Rate Calculation**: Add shipping cost estimation
6. **Customs**: Add customs declaration support for international shipping
7. **Background Jobs**: Move shipment creation to Sidekiq jobs
8. **Retry Logic**: Add automatic retry for transient failures

## Comparison with PHP Library

| Feature | PHP Library | This Implementation |
|---------|-------------|---------------------|
| Shipment Creation | ✅ | ✅ |
| Label Retrieval | ✅ | ✅ |
| Tracking | ✅ | ✅ |
| Service Points | ✅ | ✅ |
| Authentication | Basic Auth | Basic Auth |
| Error Handling | Exceptions | Exceptions |
| Data Models | Classes | Data.define |
| Rails Integration | N/A | ✅ Order model methods |
| Documentation | README | README + Examples + Architecture |

## Summary

This DHL integration provides a complete, production-ready solution for shipping and tracking with DHL Parcel. It follows Ruby and Rails best practices, optimizes for performance, and provides a developer-friendly API that matches the PHP library's functionality while adding Rails-specific conveniences.
