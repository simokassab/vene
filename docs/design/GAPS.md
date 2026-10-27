# VENÈ design: features with no backend yet

The VENÈ reskin (branch `design/vene-system`) is design-only: no schema changes, no new models, controllers or routes. The artboards in `docs/design/vene/project` show some features the app cannot do yet. This document lists them, with the artboard that shows each one and the files a full implementation would touch.

"New" marks a file that does not exist yet. Every new screen should compose the partials in `app/views/shared/vene/` (storefront and email) or `app/views/admin/shared/` (admin), and put its copy in both `config/locales/en.yml` and `config/locales/ar.yml`.

## The requested gaps

### 1. Google sign-in
**Artboards:** Account, Checkout (GoogleButton), Orders ("Signed in with Google").
**Today:** email and password through Devise only.
**Needs:** `omniauth-google-oauth2` and `omniauth-rails_csrf_protection`, a provider and uid on users, and a callback that finds or creates the user.
- `Gemfile`
- `db/migrate/*_add_omniauth_to_users.rb` (new: `provider`, `uid`, unique index)
- `app/models/user.rb` (`:omniauthable`, `from_omniauth`)
- `config/initializers/devise.rb` (`config.omniauth :google_oauth2, …`), plus credentials for the client id and secret
- `config/routes.rb` (`omniauth_callbacks: "customers/omniauth_callbacks"` on the customer `devise_for`)
- `app/controllers/customers/omniauth_callbacks_controller.rb` (new)
- `app/views/shared/vene/_google_button.html.erb` (new, per GoogleButton.dc.html; a `button_to` POST, never a GET link)
- `app/views/shared/vene/_auth_shell.html.erb`, `app/views/customers/sessions/new.html.erb`, `app/views/customers/registrations/new.html.erb`, `app/views/storefront/checkouts/show.html.erb` (render the button with an "or with email" divider)
- `app/views/storefront/orders/index.html.erb` (show "Signed in with Google" when `provider` is present)

### 2. Welcome, abandoned-bag and on-the-way emails
**Artboards:** EmailWelcome, EmailCartWaiting, EmailOnTheWay.
**Today:** only the order confirmation, admin notification and the two wishlist alerts exist. All of them use the new `layouts/mailer.html.erb` and `VeneEmailHelper`, so these three emails need content views and triggers, not new layout work.

**Welcome email**
- `app/mailers/customer_mailer.rb` (new: `welcome(user)`)
- `app/views/customer_mailer/welcome.html.erb` and `.text.erb` (new, built with `vn_email_section`, `vn_email_title` and `vn_email_button`)
- `app/controllers/customers/registrations_controller.rb` and `app/controllers/storefront/guest_registrations_controller.rb` (`deliver_later` after a successful sign-up)

**Abandoned-bag email**
- The bag lives only in `session[:cart]` (`app/services/cart.rb`), so the server never knows whose bag is waiting. A persisted cart is needed:
  - `db/migrate/*_create_saved_carts.rb` and `app/models/saved_cart.rb` (new: user or email, items as JSON, `last_activity_at`, `reminded_at`)
  - `app/services/cart.rb` (write through for signed-in users)
- `app/jobs/abandoned_cart_reminder_job.rb` (new; scheduled, e.g. with `sidekiq-cron`, plus `config/schedule.yml`)
- `app/mailers/cart_mailer.rb` and `app/views/cart_mailer/waiting.html.erb` (new)
- An unsubscribe link and consent flag, which also covers the newsletter (gap 6)

**On-the-way email**
- `app/mailers/order_mailer.rb` (`shipped(order)`)
- `app/views/order_mailer/shipped.html.erb` and `.text.erb` (new: waybill, DHL link and pieces, per EmailOnTheWay)
- `app/controllers/admin/orders_controller.rb` (`update_status` to `shipped` and `create_shipment` enqueue it); better, an `after_commit` on the status change in `app/models/order.rb` so every path sends it once

### 3. Account details and addresses pages
**Artboards:** AccountDetails, Addresses, AccountLayout.
**Today:** these exist as tabs inside `storefront/orders#index` (orders, account details, addresses, password), switched by the account nav. They are styled per the artboards, but they are not their own pages and URLs.
- `config/routes.rb` (`resource :account, only: %i[show update]`; `resources :addresses, only: :index`)
- `app/controllers/storefront/accounts_controller.rb` (new) and `app/controllers/storefront/addresses_controller.rb` (`index`; it already has create, update, destroy and set_default)
- `app/views/storefront/accounts/show.html.erb` and `app/views/storefront/addresses/index.html.erb` (new; move the profile, password and address sections out of `storefront/orders/index.html.erb`)
- `app/views/shared/vene/_account_nav.html.erb` (link to the new paths instead of `orders_path(tab: …)`)
- `app/controllers/storefront/addresses_controller.rb` (redirect to `addresses_path` instead of `orders_path(tab: "addresses")`)

### 4. Admin Menus, Specs, Payment methods and Maintenance screens
**Artboards:** AdminMenus, AdminSpecs, AdminPayments, AdminMaintenance. The AdminNav groups ("Menus", "Specifications", "Payment methods", "Maintenance mode") are not in the sidebar yet, because there is nothing behind them.

**Menus.** The header nav and mega menu are derived from active categories (`navigation_categories`, `VeneHelper#vn_mega_menus`), and the footer columns are fixed in `_site_footer.html.erb`.
- `db/migrate/*_create_menus_and_menu_items.rb`, `app/models/menu.rb`, `app/models/menu_item.rb` (new: placement, label EN/AR, link target, position, parent)
- `app/controllers/admin/menus_controller.rb` and `app/views/admin/menus/*` (new)
- `app/helpers/vene_helper.rb`, `app/views/shared/vene/_site_header.html.erb`, `app/views/shared/vene/_site_footer.html.erb` (read the menu, falling back to categories)

**Specs.** `metal`, `diamonds`, `gemstones` and `others` are free-text columns, so metal swatches, filters and translated specs cannot be built.
- `db/migrate/*_create_spec_types_and_values.rb`, `app/models/spec_type.rb`, `app/models/spec_value.rb`, plus a product join (new)
- `app/controllers/admin/spec_types_controller.rb` and `app/views/admin/spec_types/*` (new)
- `app/views/admin/products/_form.html.erb` (pick specs instead of typing them)
- `app/views/storefront/products/show.html.erb` (specification list and MetalSwatch), `app/views/storefront/categories/show.html.erb` (Metal filter per Collection.dc.html), `app/views/shared/vene/_product_card.html.erb` (metal line)

**Payment methods.** Only MontyPay card payment is offered. The locale files already carry cash-on-delivery copy (`checkout.pay_cod`, `checkout.cod_fee`), and orders have `payment_method` and `cod_fee` columns, but there is no setting to switch methods on or price them.
- `db/migrate/*_add_payment_methods_to_settings.rb` (enabled methods, COD fee, COD countries)
- `app/views/admin/settings/show.html.erb` (or a new `admin/payment_methods` screen per AdminPayments)
- `app/views/storefront/checkouts/review.html.erb` (render a ChoiceCard per enabled method; today it posts `payment_method=card`)
- `app/controllers/storefront/checkouts_controller.rb` (accept and validate the chosen method)

**Maintenance.** Maintenance is the `maintenance_mode` switch in Settings, styled with a status banner. AdminMaintenance also shows a custom message, a scheduled end and a preview.
- `db/migrate/*_add_maintenance_details_to_settings.rb` (`maintenance_message_en`, `maintenance_message_ar`, `maintenance_ends_at`)
- `app/views/admin/settings/show.html.erb` or a new `admin/maintenance` screen, plus a preview link
- `app/views/shared/maintenance.html.erb` (show the message and expected return time instead of the fixed I18n copy)

### 5. Newsletter signup
**Artboards:** SiteFooter ("Letters from the atelier"), Account and Checkout ("Send me letters from the atelier").
**Today:** nothing stores consent or addresses, so the footer form is left out (the intro column carries the house tagline instead) and so are the sign-up checkboxes.
- `db/migrate/*_create_newsletter_subscribers.rb` and `app/models/newsletter_subscriber.rb` (new: email, locale, consented_at, source, unsubscribe token), or an ESP integration in `app/services/`
- `config/routes.rb` (`resources :newsletter_subscriptions, only: %i[create destroy]`) and `app/controllers/storefront/newsletter_subscriptions_controller.rb` (new; Rack::Attack throttle in `config/initializers/rack_attack.rb`)
- `app/views/shared/vene/_site_footer.html.erb` (the form, per SiteFooter.dc.html)
- `app/views/customers/registrations/new.html.erb`, `app/views/storefront/checkouts/show.html.erb` (opt-in checkbox) and `app/controllers/customers/registrations_controller.rb`, `app/controllers/storefront/checkouts_controller.rb` (record consent)

### 6. Currency in the header select
**Artboard:** SiteHeader (currency select in the noir utility bar).
**Today:** the select is built and works. Changing it reloads the page with `?set_currency=XXX`, which uses the existing session switch in `ApplicationController#set_visitor_currency`. Three things are not backed:
- The choice lives in the session only and is not saved to the account. Needs a `preferred_currency` column on users (`db/migrate/*`), `app/models/user.rb`, and `ApplicationController#set_visitor_currency` reading it for signed-in users.
- Without JavaScript the select does nothing, because it relies on `onchange`. Wrap it in a GET form with a `<noscript>` submit in `app/views/shared/vene/_site_header.html.erb`.
- The footer currency row (`_site_footer.html.erb`) is display-only. Making it a second switcher needs the same links.

## Other gaps found while building

| Design feature | Artboard | Why it is not built | Files it would touch |
| --- | --- | --- | --- |
| Track an order without an account (order number + email or phone) | Tracking | `orders#show` is reachable by guests only within their session; there is no lookup by number and email. The auth shell and footer link to Your orders instead. | `config/routes.rb` (`resource :order_lookup`), `app/controllers/storefront/order_lookups_controller.rb` (new, rate-limited), `app/views/storefront/order_lookups/new.html.erb` (new), `_site_footer.html.erb`, `_auth_shell.html.erb` |
| Client-facing DHL journey timeline | Tracking | `Order#dhl_tracking_info` calls DHL live, and admins already see it on `admin/orders#tracking`. Calling it on every client page view would be slow and rate-limited. | A cached tracking-events table or column, refreshed by a job (`app/jobs/dhl_tracking_refresh_job.rb`, new); `app/views/storefront/orders/show.html.erb` (Timeline) |
| Tracking update preferences (email, WhatsApp) | Tracking | No preference storage or WhatsApp messaging integration. | Order or user columns, the on-the-way email (gap 2), a WhatsApp Business API service |
| Gift note in the bag | Cart | No field on carts or orders. | `db/migrate/*_add_gift_note_to_orders.rb`, `app/services/cart.rb`, `app/views/storefront/carts/show.html.erb`, `checkouts_controller.rb`, `order_mailer/admin_notification.html.erb`, `InvoiceGenerator` |
| "Save for later" and "Move to bag" from the bag | Cart | Wishlist create exists, but no cart action moves a line to the wishlist and removes it in one step. | `app/controllers/storefront/carts_controller.rb` (`save_for_later`), `config/routes.rb`, `carts/show.html.erb` |
| Metal swatches on product and home | Product, Main | Metal is free text with no colour variants (see Specs, gap 4). | See Specs |
| Orders search and CSV export, DHL connection status card | AdminOrders | No search params or export action; no stored integration health. | `admin/orders_controller.rb` (ransack search, `index.csv`), `config/routes.rb`, `admin/orders/index.html.erb` |
| Ratings and reviews | Product | No reviews model. The previous page showed a hard-coded "(4.9) · 127 reviews"; it has been removed. | `db/migrate/*_create_reviews.rb`, `app/models/review.rb`, admin moderation screens, `products/show.html.erb` |
| Our Story page | OurStory | The page exists only if an admin creates a CMS page with the slug `our-story`; `db/seeds.rb` does not. The footer now links to the home page's story section (`/#our-story`) so it never 404s. | `db/seeds.rb` (seed the page), or a dedicated view per OurStory.dc.html |
| Ring size guide as a page | RingSizeGuide | The guide is the existing PDF (`public/documents/ring-size-guide.pdf`), shown in a dialog. The artboard is a native page with a size table and a measuring guide. | `config/routes.rb`, `app/views/storefront/pages/ring_size.html.erb` (new) or a CMS page, sizes data |
| Saved ring size on the account | Orders | No column. | `db/migrate/*_add_ring_size_to_users.rb`, account details form, product size preselection |

## Pre-existing issues noticed (not caused by the reskin)

- `bin/rails test` reports 12 errors on `main` and on this branch: `test/fixtures/products.yml` still sets a `category` column, which no longer exists since products moved to `sub_category`. Fixing the fixture unblocks the model tests.
- After updating a cart quantity, the "Cart updated" notice is never seen. Turbo fetches the redirected page and then reloads it, and the reload consumes the flash. This happens on `main` too.
- The old admin layout signed out through the customer session route even when the admin had signed in through the admin scope. The new layout signs out of the scope that is actually in use.
- `admin/wishlists#index` raised `NoMethodError` (`VariantOption#name`) for any wishlist item with a variant. The new view uses `ProductVariant#display_name`.
