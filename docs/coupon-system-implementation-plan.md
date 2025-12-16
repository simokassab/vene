# Coupon/Discount Code System Implementation Plan

## Overview
Implement a comprehensive coupon system with admin management and customer cart integration. Coupons support percentage or fixed discounts, date ranges, per-user usage limits, and minimum order requirements.

## User Requirements Summary
- Admin can create/manage coupons with discount type (percentage/fixed), value, validity dates
- Optional `single_use_per_user` flag (if true: one use per customer, if false: unlimited per customer)
- Optional total `usage_limit` across all customers
- Optional `min_order_amount` requirement
- Customers apply coupons in cart before checkout
- Discounts apply to subtotal only (Total = Subtotal - Discount + Shipping)
- Coupon data persists with orders for historical tracking

---

## Phase 1: Database Schema (3 Migrations)

### Migration 1: Create Coupons Table
**File**: `db/migrate/YYYYMMDDHHMMSS_create_coupons.rb`

```ruby
create_table :coupons do |t|
  t.string :code, null: false                           # Unique coupon code (uppercase)
  t.string :discount_type, null: false, default: "percentage"  # "percentage" or "fixed"
  t.decimal :discount_value, precision: 10, scale: 2, null: false, default: 0.0
  t.boolean :active, default: true, null: false
  t.date :valid_from                                    # Optional start date
  t.date :valid_until                                   # Optional expiry date
  t.boolean :single_use_per_user, default: false       # Per-user usage restriction
  t.integer :usage_limit                                # Optional total usage cap
  t.integer :usage_count, default: 0, null: false       # Current usage counter
  t.decimal :min_order_amount, precision: 10, scale: 2 # Optional minimum subtotal

  t.timestamps
end

add_index :coupons, :code, unique: true
add_index :coupons, :active
add_index :coupons, :discount_type
add_index :coupons, [:valid_from, :valid_until]
```

### Migration 2: User Coupons Join Table
**File**: `db/migrate/YYYYMMDDHHMMSS_create_user_coupons.rb`

Tracks which users have used which coupons (for single_use_per_user validation).

```ruby
create_table :user_coupons do |t|
  t.references :user, null: false, foreign_key: true
  t.references :coupon, null: false, foreign_key: true
  t.references :order, null: false, foreign_key: true

  t.timestamps
end

add_index :user_coupons, [:user_id, :coupon_id]
add_index :user_coupons, [:coupon_id, :user_id]
```

### Migration 3: Add Coupon to Orders
**File**: `db/migrate/YYYYMMDDHHMMSS_add_coupon_to_orders.rb`

```ruby
add_column :orders, :coupon_code, :string
add_column :orders, :discount_amount, :decimal, precision: 10, scale: 2, default: 0.0, null: false
add_reference :orders, :coupon, foreign_key: true

add_index :orders, :coupon_code
```

---

## Phase 2: Models

### Coupon Model
**File**: `app/models/coupon.rb`

**Associations:**
- `has_many :user_coupons, dependent: :destroy`
- `has_many :users, through: :user_coupons`
- `has_many :orders`

**Validations:**
- Code: presence, uniqueness (case-insensitive), auto-uppercase
- Discount type: inclusion in `%w[percentage fixed]`
- Discount value: numericality (> 0)
- Percentage: custom validation (≤ 100%)
- Usage limit: numericality (≥ 0, integer), allow_nil
- Min order amount: numericality (≥ 0), allow_nil
- Date range: custom validation (valid_until > valid_from)

**Key Methods:**
- `calculate_discount(subtotal)` - Returns discount amount based on type
  - Percentage: `subtotal × (discount_value / 100)`
  - Fixed: `min(discount_value, subtotal)`
- `valid_for_use?(user:, subtotal:)` - Returns `{valid: Boolean, error: String}`
  - Checks: active, date range, usage limits, per-user usage, min amount
- `increment_usage!` - Atomic counter increment
- `discount_display` - Formatted display ("20%" or "$50.00")

**Scopes:**
- `active` - where(active: true)
- `valid_now` - active + date range check
- `ordered` - order(created_at: :desc)

**Ransack:** Enable search on code, discount_type, discount_value, dates, active

### UserCoupon Model
**File**: `app/models/user_coupon.rb`

Simple join model with uniqueness validation on `[:user_id, :coupon_id]`.

### Order Model Updates
**File**: `app/models/order.rb`

**Add association:** `belongs_to :coupon, optional: true`

**Update `update_totals!` method:**
```ruby
def update_totals!(settings)
  self.subtotal = order_items.sum(&:line_total)
  self.tax_amount = 0
  self.shipping_amount = settings.shipping_flat_rate || 0
  self.total_amount = subtotal - discount_amount + shipping_amount
  save!
end
```

### User Model Updates
**File**: `app/models/user.rb`

**Add associations:**
- `has_many :user_coupons, dependent: :destroy`
- `has_many :coupons, through: :user_coupons`

---

## Phase 3: Cart Service Integration

### Update Cart Service
**File**: `app/services/cart.rb`

**Add methods:**
- `apply_coupon(code, user)` - Validates and applies coupon to session
  - Lookup: `Coupon.find_by("UPPER(code) = ?", code.upcase.strip)`
  - Validate: `coupon.valid_for_use?(user: user, subtotal: subtotal)`
  - Store in session: `coupon_code`, `coupon_id`, `discount_amount`
  - Return: `{success: Boolean, coupon: Coupon, discount: Decimal, error: String}`

- `remove_coupon` - Clear coupon from session

- `has_coupon?` - Check if coupon applied

- `coupon` - Load coupon from session (memoized)

- `discount_amount` - Get discount from session as BigDecimal

- `total_after_discount` - `subtotal - discount_amount`

- `grand_total(shipping_amount)` - `total_after_discount + shipping_amount`

**Session structure:**
```ruby
session[:coupon_code] = "SUMMER2025"
session[:coupon_id] = 1
session[:discount_amount] = 25.00
```

---

## Phase 4: Controllers

### Admin Coupons Controller
**File**: `app/controllers/admin/coupons_controller.rb`

Standard RESTful controller inheriting from `Admin::BaseController`:
- **Actions:** index, new, create, edit, update, destroy, toggle_active
- **Index:** Ransack search with pagination (20 items), includes(:orders)
- **Strong params:** Permit all coupon fields except usage_count

### Storefront Carts Controller
**File**: `app/controllers/storefront/carts_controller.rb`

**Add actions:**
- `apply_coupon` - POST, calls `Cart#apply_coupon`, redirects with notice/alert
- `remove_coupon` - DELETE, calls `Cart#remove_coupon`, redirects with notice

### Storefront Checkouts Controller
**File**: `app/controllers/storefront/checkouts_controller.rb`

**Update `create` action:**
1. Build order with items
2. If `@cart.has_coupon?`:
   - Load coupon from cart
   - **Re-validate** coupon (security: don't trust session)
   - If valid: Set `order.coupon`, `order.coupon_code`, `order.discount_amount`
   - If invalid: Remove from session, show alert
3. Save order, call `update_totals!(settings)`
4. If coupon present:
   - Create `UserCoupon` record (user, coupon, order)
   - Call `coupon.increment_usage!`
5. Clear cart and coupon from session
6. Proceed to payment

---

## Phase 5: Routes

### Admin Routes
**File**: `config/routes.rb`

```ruby
namespace :admin do
  resources :coupons do
    member do
      patch :toggle_active
    end
  end
end
```

### Storefront Routes
**File**: `config/routes.rb`

```ruby
resource :cart, only: [:show], controller: "storefront/carts" do
  post :add_item
  patch :update_item
  delete :remove_item
  post :apply_coupon      # NEW
  delete :remove_coupon   # NEW
end
```

---

## Phase 6: Admin Views

### Index View
**File**: `app/views/admin/coupons/index.html.erb`

**Features:**
- Header with "New Coupon" button
- Ransack search form (code, discount_type, active status filters)
- Table columns: Code (monospace font), Discount (value + type), Valid Dates, Usage (count/limit), Status (badge), Actions
- Empty state with icon
- Pagy pagination

### Form Partial
**File**: `app/views/admin/coupons/_form.html.erb`

**Fields:**
- Code (text, uppercase, monospace)
- Discount Type (select: percentage/fixed)
- Discount Value (number, step 0.01)
- Valid From / Valid Until (date fields)
- Usage Limit (number, optional)
- Min Order Amount (number, optional)
- Single Use Per User (checkbox)
- Active (checkbox)

**Follow pattern:** Existing admin form styles with Tailwind CSS

### New/Edit Views
**Files:** `app/views/admin/coupons/new.html.erb`, `edit.html.erb`

Simple wrappers that render `_form` partial.

---

## Phase 7: Storefront Views

### Cart View Updates
**File**: `app/views/storefront/carts/show.html.erb`

**Add after subtotal line (~line 219):**

**If coupon applied:**
- Green success box showing: "Coupon applied: CODE", discount display, "Remove" link

**If no coupon:**
- Input form with code field (monospace, uppercase) + "Apply" button

**In price breakdown:**
- Subtotal (existing)
- Discount (NEW - if coupon): Show `-$XX.XX` in green with coupon code
- Shipping (existing)
- Total (UPDATE calculation): `@cart.total_after_discount + shipping`

### Checkout View
**File**: `app/views/storefront/checkouts/show.html.erb`

**Show discount if coupon applied** (same display as cart).

### Order Show Views
**Files:** `app/views/storefront/orders/show.html.erb`, `app/views/admin/orders/show.html.erb`

**Add discount line** in price breakdown (if `order.discount_amount > 0`):
```erb
<div>Discount (<%= order.coupon_code %>): -$XX.XX</div>
```

---

## Phase 8: Translations

### English (en.yml)
**File**: `config/locales/en.yml`

```yaml
admin:
  coupons:
    title: "Discount Coupons"
    subtitle: "Manage promotional discount codes"
    new: "New Coupon"
    edit: "Edit Coupon"
    created: "Coupon created successfully"
    # ... (30+ translation keys for admin)

coupons:
  enter_code: "Enter coupon code"
  apply: "Apply"
  applied: "Discount applied: %{discount}"
  discount: "Discount"
  removed: "Coupon removed"
  errors:
    not_found: "Coupon code not found"
    inactive: "This coupon is not active"
    expired: "This coupon expired on %{date}"
    # ... (10+ error messages)
```

### Arabic (ar.yml)
**File**: `config/locales/ar.yml`

Mirror all English translations in Arabic.

---

## Phase 9: Admin Navigation

**File**: `app/views/layouts/admin.html.erb` (or admin nav partial)

Add "Coupons" link to admin sidebar navigation between existing menu items.

---

## Phase 10: Edge Cases & Security

### Edge Cases Handled:

1. **Coupon deleted after applied to order:**
   - `order.coupon_code` stores code as string (survives deletion)
   - `order.coupon` foreign key is nullable

2. **Coupon becomes invalid during checkout:**
   - Re-validate in checkout controller
   - Remove from session if invalid
   - Show error, proceed without discount

3. **Race condition on usage_limit:**
   - Use `increment!(:usage_count)` for atomic operation
   - Database enforces consistency

4. **Subtotal changes after coupon applied:**
   - Recalculate discount at checkout (don't trust session)

5. **Case sensitivity:**
   - Auto-uppercase in model
   - Case-insensitive lookups: `UPPER(code) = ?`

### Security Measures:

1. **Session tampering:** Always recalculate discount server-side at checkout
2. **SQL injection:** Use parameterized queries
3. **Mass assignment:** Strong parameters, never permit `usage_count`
4. **Authorization:** Admin controllers protected by `Admin::BaseController`

---

## Critical Files to Modify/Create

### Create New Files (15):
1. `db/migrate/xxx_create_coupons.rb`
2. `db/migrate/xxx_create_user_coupons.rb`
3. `db/migrate/xxx_add_coupon_to_orders.rb`
4. `app/models/coupon.rb`
5. `app/models/user_coupon.rb`
6. `app/controllers/admin/coupons_controller.rb`
7. `app/views/admin/coupons/index.html.erb`
8. `app/views/admin/coupons/new.html.erb`
9. `app/views/admin/coupons/edit.html.erb`
10. `app/views/admin/coupons/_form.html.erb`

### Modify Existing Files (9):
1. `app/models/order.rb` - Add association, update `update_totals!`
2. `app/models/user.rb` - Add associations
3. `app/services/cart.rb` - Add coupon methods
4. `app/controllers/storefront/carts_controller.rb` - Add apply/remove actions
5. `app/controllers/storefront/checkouts_controller.rb` - Integrate coupon in checkout
6. `config/routes.rb` - Add coupon routes
7. `app/views/storefront/carts/show.html.erb` - Add coupon input/display
8. `config/locales/en.yml` - Add translations
9. `config/locales/ar.yml` - Add translations

---

## Implementation Order

1. **Migrations** → Run `rails db:migrate`
2. **Models** → Implement Coupon, UserCoupon, update Order/User
3. **Cart Service** → Add coupon session management
4. **Admin CRUD** → Controller, routes, views
5. **Storefront Integration** → Cart controller actions, checkout updates
6. **Views** → Cart coupon UI, admin tables
7. **Translations** → Add all i18n keys
8. **Testing** → Model validations, controller actions, edge cases

---

## Testing Checklist

- [ ] Model: Discount calculations (percentage, fixed, capped)
- [ ] Model: Validation rules (dates, limits, single-use)
- [ ] Model: `valid_for_use?` method scenarios
- [ ] Controller: Apply valid/invalid coupons
- [ ] Controller: Remove coupon from cart
- [ ] System: Full checkout flow with coupon
- [ ] Edge case: Coupon expires during session
- [ ] Edge case: Usage limit reached
- [ ] Security: Session tampering detection

---

## Performance Optimizations

- **Indexes:** Unique on code, composite on date range, foreign keys
- **Queries:** Use `exists?` for user usage check (faster than count)
- **Atomic ops:** `increment!(:usage_count)` prevents race conditions
- **Eager loading:** Admin index uses `includes(:orders)`
- **N+1 prevention:** Ransack queries optimized

---

## Post-Launch Enhancements (Future)

- Analytics dashboard (most used coupons, revenue impact)
- Category/product-specific coupons
- Auto-apply coupons based on user segments
- Bulk coupon generation
- Email campaigns with coupon codes
