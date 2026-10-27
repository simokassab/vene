# Plan: colors and sizes on one product, with photos per color

Status: decisions made (section 9), not started. Written 2026-10-27 against branch `design/vene-system`.

## 1. What we want

A customer opens a necklace that comes in rose gold, yellow gold and white gold, and in 40 cm and 45 cm.

- They see one row of color swatches and one row of lengths.
- Clicking **Rose gold** swaps the main photo and the thumbnails to the rose gold photos.
- Lengths that are sold out in rose gold are greyed out, and still selectable if made-to-order is allowed for that combination.
- The bag, the order, the emails, the invoice and the admin all say "Rose gold · 45 cm" and show the rose gold photo.
- A link to the product can open on a given color (`?color=rose-gold`), for Instagram and ads.

A product with only colors, only sizes, or no variants at all keeps working as it does today.

## 2. How it works today

| Piece | Today | Limit |
|---|---|---|
| `ProductVariant` | One row per sellable option, with its own `stock_quantity`, `active`, `allow_preorder` and delivery date | Holds **one** `variant_option_id`, so a row can be "Rose gold" or "52", never both |
| `VariantType` / `VariantOption` | Admin-managed lists ("Ring Size" with 48–70) | English names only: Arabic pages show "Size" and "Rose gold" in English. No color value for a swatch |
| `ProductImage` | Belongs to the product, ordered by `position` | Not tied to any option |
| Admin product form | Pick **one** variant type, then stock per option | `process_variants` reads only one type |
| Product page | Reads the type from the **first** variant | Can show one selector row only |
| Cart, orders, wishlist | Keyed by `product_variant_id` | Fine: these only need a SKU id |
| `Product#metal` | One text field on the product | Wrong once a piece comes in three metals |

The cart key, `order_items.product_variant_id`, `wishlist_items.product_variant_id`, stock decrement on order and stock restore on cancel all work on one variant id. **If a variant stays "one sellable SKU", none of that has to change.** The design below keeps it that way.

## 3. Data model

### 3.1 A variant becomes a combination of options

New join table: each variant has one option per type.

```ruby
create_table :product_variant_options do |t|
  t.references :product_variant, null: false, foreign_key: { on_delete: :cascade }
  t.references :variant_type,    null: false, foreign_key: true
  t.references :variant_option,  null: false, foreign_key: true
  t.timestamps
  t.index %i[product_variant_id variant_type_id], unique: true   # one color, one size per variant
  t.index :variant_option_id                                     # "which variants are rose gold"
end
```

To stop the same combination being created twice for one product, store a sorted signature on the variant:

```ruby
add_column :product_variants, :option_signature, :string          # "12-48" = sorted option ids
add_index  :product_variants, %i[product_id option_signature], unique: true,
           where: "option_signature IS NOT NULL"
```

`ProductVariant` sets `option_signature` in `before_validation` from its options. The database index is the real guard; the model validation gives a readable error.

Models:

```ruby
class ProductVariant < ApplicationRecord
  has_many :product_variant_options, dependent: :delete_all, autosave: true
  has_many :variant_options, through: :product_variant_options
  # keep belongs_to :variant_type / :variant_option until step 8.3 (old data, old code paths)
end

class ProductVariantOption < ApplicationRecord
  belongs_to :product_variant
  belongs_to :variant_type
  belongs_to :variant_option
  validate :option_belongs_to_type   # variant_option.variant_type_id == variant_type_id
end
```

### 3.2 Types and options get Arabic names, an order and a display kind

```ruby
add_column :variant_types,   :name_ar,  :string
add_column :variant_types,   :position, :integer, default: 0, null: false   # Color row above Size row
add_column :variant_types,   :display,  :string,  default: "text", null: false  # "swatch" | "text"
add_column :variant_types,   :drives_images, :boolean, default: false, null: false
add_column :variant_options, :value_ar, :string
add_column :variant_options, :slug,     :string                 # "rose-gold", for ?color=rose-gold
add_column :variant_options, :swatch_color, :string             # "#B76E79", data not styling
add_column :variant_options, :default_choice, :boolean, default: false, null: false  # Yellow gold
add_index  :variant_options, %i[variant_type_id slug], unique: true
add_index  :variant_options, :variant_type_id, unique: true, where: "default_choice",
           name: "index_variant_options_one_default_per_type"
```

- `name(locale)` / `value(locale)` follow the pattern every other model uses (`name_en`/`name_ar`): fall back to English when the Arabic is blank. `VariantType#name` stays the English column so nothing breaks.
- **Arabic names are entered by the admin** on the variant types screen (decision 7). No translations ship in code or in the backfill; until the admin fills them, Arabic pages fall back to the English name, as today.
- `drives_images`: the type whose choice changes the photos (Color). Only one type should have it; validate that.
- `swatch_color` is product data, like a product photo. It is drawn as an inline `background-color` on a flat round dot, which is the one place the design system allows a data color. **Flat dots only** (decision 5): no swatch photos.
- `default_choice`: the option preselected on the product page. The admin ticks it on **Yellow gold** (decision 4); the partial unique index allows one default per type. A flag rather than a hard-coded name, so renaming the option doesn't break it.

### 3.3 Photos per color

```ruby
add_reference :product_images, :variant_option, foreign_key: { on_delete: :nullify }, null: true
add_index :product_images, %i[product_id variant_option_id position]
```

- A photo with no option is shown for every color (packaging, model shots, lifestyle).
- A photo with an option is shown only when that color is selected.
- Photos attach to the **color option**, not to a variant, so all sizes of rose gold share them and the admin uploads each photo once.

Lookups:

```ruby
class Product
  # Photos for one color, then shared photos. Uses the loaded association when present.
  def images_for(option_id)
    imgs = product_images.to_a
    imgs.select { |i| i.variant_option_id == option_id } + imgs.select { |i| i.variant_option_id.nil? }
  end
end

class ProductVariant
  def image_option_id   = variant_options.find { |o| o.variant_type.drives_images? }&.id
  def primary_image     = product.images_for(image_option_id).first || product.primary_image
end
```

### 3.4 Price: one price per product

**Decided (decision 1): every combination of a design costs the same.** No price column on variants; `Product#current_price` stays the only price, and the cart, checkout, analytics and wishlist price-drop code are untouched. If this ever changes, it is one nullable `price` column on `product_variants` plus every place that reads `product.current_price` for a line.

### 3.5 `Product#metal`

When the piece comes in several metals, the product's single `metal` text is misleading. Options: leave it as the product-level description ("18k gold") and let the color carry "rose / yellow / white", or hide it when a `drives_images` type is present. Recommendation: keep the field, change its admin hint to "material, without color".

## 4. Admin

### 4.1 Variant types screen

- Add Arabic name, display kind (swatch or text), "changes photos" switch, order.
- On each option: Arabic value, slug (generated from the English value, editable), swatch color picker when the type is a swatch type.
- `VariantOption` already has `restrict_with_error` from variants; keep it, and show the error instead of silently failing.

### 4.2 Product form: a variant matrix

Replace the single "Variant type" select with:

1. **Choose types**: checkboxes, e.g. Color, Ring Size and Stone. **Any number of types** (decision 2: some products combine more than color and size). Rows are the cartesian product of the chosen options, built in Alpine.
2. **Choose options per type**: chips, e.g. Rose gold, Yellow gold, White gold; 48–56.
3. **Matrix**: one row per combination, generated in Alpine from the two lists:

   | Color | Size | Stock | Made to order | Delivery date | Active |
   |---|---|---|---|---|---|

   - One column per chosen type, so a third type adds a column, not a new screen.
   - Rows grouped under the image-driving type (a collapsible block per color), because 3 colors × 9 sizes × 3 stones is 81 rows.
   - Bulk tools above the table: "set stock for all", "set stock for this color", "made to order for all", plus a filter by any option.
   - A count above the grid ("81 combinations, 12 in stock") and a warning before saving more than 150 rows.
   - Existing variants keep their row and id; new combinations appear with stock 0.
4. **Photos**: each photo gets a "Color" select (shared / Rose gold / …), saved through `product_images_attributes[][variant_option_id]`. Upload accepts a color for the whole batch so the admin can upload five rose gold photos at once.

### 4.3 Saving: a service, not the controller

Move `process_variants` out of `Admin::ProductsController` into `Products::VariantMatrixSync` (`app/services/products/variant_matrix_sync.rb`):

- Input: product, list of rows `{ id, option_ids: [..], stock_quantity, allow_preorder, preorder_estimated_delivery_date, active }`.
- In one transaction: upsert rows by `option_signature`, then for combinations no longer submitted, **deactivate, don't destroy**.
- Returns a result with errors so the form can show them.

Why deactivate: today `process_variants` calls `variant.destroy` on removed options, but `ProductVariant has_many :order_items, dependent: :restrict_with_error`. Any variant that was ever ordered can't be destroyed, and the failure is silent, so the removed option stays live on the storefront. Deactivating fixes that and keeps order history intact. A variant with no orders and no wishlist rows can be deleted.

Also fix while there: today new rows with stock 0 and no made-to-order are skipped silently, so an admin can't add a sold-out combination to show it greyed out. In the matrix every checked combination is saved.

### 4.4 Other admin screens

- Orders show, preorders, wishlists, webhooks and the dashboard read `display_name`. They need the new format and the color photo for the line (`vn_product_image_url` gets a `variant:` argument).
- Products index: show a "3 colors · 9 sizes" hint instead of nothing.

## 5. Storefront

### 5.1 Product page

Server builds one JSON payload, no extra requests:

```json
{
  "types":   [{ "id": 3, "name": "اللون", "display": "swatch", "drivesImages": true,
                "options": [{ "id": 12, "slug": "rose-gold", "label": "ذهب وردي", "swatch": "#B76E79" }] },
              { "id": 1, "name": "المقاس", "display": "text", "options": [...] }],
  "variants": [{ "id": 81, "options": [12, 48], "stock": 2, "madeToOrder": false, "deliveryDate": null }],
  "images":   { "12": ["/uploads/...rose_1.jpg", "..."], "shared": ["..."] }
}
```

Alpine state: `selected = { typeId: optionId }`.

- **Variant lookup**: the variant whose `options` equal the selected ids. It feeds the existing `selectedVariant`, so the stock, made-to-order, WhatsApp and add-to-bag logic already in the page keeps working unchanged.
- **Sold-out options are greyed out, not hidden** (decision 3): an option is unavailable if no active, purchasable variant has it together with the current other selections. It stays in place, greyed and struck through, with `aria-disabled`, still focusable, and the reason in its label ("Sold out in rose gold"). With any number of rows, availability is checked against all other current selections, so the logic is the same for two or three types.
- **Photos**: when the image-driving option changes, `galleryImages = images[optionId] + images.shared`, `activeImage = galleryImages[0]`, zoom reset. Thumbnails render from `galleryImages` with `x-for`, keyed by URL.
- **Default selection** (decision 4): `?color=` slug if present; otherwise the option flagged `default_choice` (**Yellow gold**) if this product offers it; otherwise the first color with stock. Yellow gold is preselected even when it is sold out, so the page opens on the photos the owner chose, with the sold-out state shown. Size and other types are left empty so the customer chooses (rings must never default a size).
- **URL**: on color change, `history.replaceState` to `?color=slug` (no reload, Turbo-safe).
- **Accessibility**: each row is a `radiogroup` with a `legend`; swatches are radio buttons with the color name as the label, a visible ring for the selected one, and a text label of the current choice next to the legend ("Color: Rose gold"). Color is never the only signal.
- **RTL**: rows read right-to-left, labels come from `name(locale)`/`value(locale)`, sizes wrapped in `<bdi>`.
- **Ring size guide**: keep the current trigger, now tied to the type with `display: text` whose name matches size, instead of the first variant.
- **Preload**: preload the first image of each color after page load so switching is instant.

### 5.2 Product cards (collections, search, wishlist, related)

- Show up to four small swatches under the name when the product has an image-driving type ("+2" when more).
- Hovering or tapping a swatch swaps the card photo to that color's first photo and changes the link to `?color=slug`.
- Phase 2 item: the card works without it.

### 5.3 Bag, checkout, orders, emails, invoice

- `ProductVariant#display_name(locale)`: options ordered by type `position`, labels in the locale, joined with " · " ("ذهب وردي · 52"). Drop the "Type: value" format.
- Line photos: `item.product_variant&.primary_image || product.primary_image` in `carts/show`, `_line_item`, `_order_summary`, `_order_card`, `orders/show`, both order emails, both wishlist emails.
- Invoice (Prawn): second line uses the new `display_name` in the order's locale. Prawn needs the Arabic font set for Arabic labels; check `InvoiceGenerator` handles RTL before switching.
- `made_to_order_whatsapp_url(@product, variant:)`: message text uses the new display name.
- GA4 `item_variant` and Meta: the new display name, English, so reports don't split by locale.

### 5.4 Wishlist

Unchanged in shape (`product_variant_id`). The heart on the product page saves the current combination once one is complete, or the product alone before that. Back-in-stock and price-drop jobs are already variant-aware.

### 5.5 Collection filter by color (optional, phase 2)

`Product.joins(product_variants: :product_variant_options).where(product_variant_options: { variant_option_id: ids }, product_variants: { active: true }).distinct`, with the index on `variant_option_id`. A "Color" filter on collection and search pages. Needs `ransackable_associations` updated.

## 6. Queries and performance

- Product page: one query each for product, images, variants, variant options with types (`includes(product_variants: { product_variant_options: [:variant_option, :variant_type] })`). Build the JSON in a presenter/helper, not in the view.
- Cart: `Cart#items` already loads variants by id in bulk; add `includes(variant_options: :variant_type)` there so `display_name` doesn't run a query per line.
- Collections with swatches: one grouped query for "option ids per product" for the page's products, plus images with `variant_option_id` for those products. No per-card queries.
- Prosopite is on in development; the sweep in step 7 should show no N+1 warnings.

## 7. Tests

The test suite is not usable today: 12 errors because `test/fixtures/products.yml` has a `category` column that no longer exists. **Step zero is to fix the fixtures**, otherwise none of the tests below can run.

- Model: `ProductVariant` with two options; signature uniqueness; one option per type; option must belong to its type; `display_name` in both locales and type order; `primary_image` falls back to shared photo, then product photo.
- Model: `Product#images_for`.
- Service: `VariantMatrixSync` creates, updates, deactivates ordered variants instead of destroying, saves sold-out combinations, rolls back on error.
- Request: add to bag with a two-option variant; reject a variant of another product (existing guard); reject an inactive combination.
- Request: admin product update with the matrix params.
- Migration/backfill: existing single-option variants get exactly one join row and a signature; running it twice changes nothing.
- System (Capybara): choose color → photo changes; choose size sold out in that color → disabled; add to bag → bag shows "Rose gold · 52" with the rose photo. EN and AR.

## 8. Rollout

### 8.1 Migrations (additive, safe to deploy before the code that uses them)

1. `create_product_variant_options` + `product_variants.option_signature` (+ partial unique index).
2. Columns on `variant_types` and `variant_options`; `variant_options.slug` index.
3. `product_images.variant_option_id`.

All are new tables or nullable columns, no locks on large tables. Indexes on `product_images` and `product_variants` are small; `algorithm: :concurrently` is not needed at current sizes but costs nothing to add with `disable_ddl_transaction!`.

### 8.2 Backfill (rake task, idempotent)

`bin/rails variants:backfill_options`:

- For each `ProductVariant` with `variant_option_id`: create its one join row, set `option_signature`.
- Generate `slug` for every option from the English value.
- **Legacy `name`/`value` variants** (no type/option): report them. Before deploying, run in production console: `ProductVariant.where(variant_option_id: nil).count`. If zero, drop the legacy path. If not, convert them by finding or creating a matching type/option, or keep them displaying as today.
- `DRY_RUN=1` prints what it would do, like `variant_options:extend_sizes`.

### 8.3 Cleanup (a later release)

After the new code has run in production for a while: remove `product_variants.variant_type_id`, `variant_option_id`, `name`, `value`, the old unique index on `(product_id, name, value)`, and the legacy branch in `validate_variant_data`.

### 8.4 Order of work and estimate

| Step | Work | Days |
|---|---|---|
| 0 | Fix test fixtures so the suite runs | 0.5 |
| 1 | Migrations, models, backfill task, model tests | 1 |
| 2 | Admin: variant types screen (Arabic, swatch, slug, default), product matrix for any number of types, photo color tags, `VariantMatrixSync` | 2.5 |
| 3 | Product page: selectors, availability, photo switching, `?color=`, a11y, RTL | 1.5 |
| 4 | Bag, checkout, orders, emails, invoice, WhatsApp, analytics, admin order screens | 1 |
| 5 | Tests (request, system), EN/AR check at 1440 and 390, data entry on staging | 1 |
| | **Release 1 total** | **about 7.5 working days** |
| 6 | Phase 2: swatches on product cards, color filter on collections | 1.5 |
| 7 | Later release: drop legacy columns | 0.5 |

Branch from `design/vene-system` (all the views this touches were rewritten there), not from `main`.

## 9. Product owner decisions (2026-10-27)

| # | Question | Decision | Effect on the plan |
|---|---|---|---|
| 1 | Can a color or size cost more? | No: the same design has the same price | No variant price (3.4) |
| 2 | More than color and size on one product? | Yes | Matrix handles any number of types (4.2), +0.5 day |
| 3 | Sold-out combinations | Greyed out | 5.1 |
| 4 | Default color | Yellow gold | `default_choice` flag on the option (3.2, 5.1) |
| 5 | Swatches | Flat color dots | `swatch_color` only, no swatch photos (3.2) |
| 6 | Every color photographed? | Yes | Shared-photo fallback stays as a safety net only |
| 7 | Arabic names for colors and sizes | The admin enters them in the dashboard | Arabic fields on the variant types screen, English fallback (3.2) |

## 10. Risks

- **Data entry is the real cost**: every product with colors needs photos re-tagged and combinations entered. Plan a session with the owner on staging; the matrix bulk tools exist to make this fast.
- **Stock spread thin**: a ring in 3 colors × 9 sizes is 27 stock counts, and a third type multiplies that again. Made-to-order per combination keeps this manageable for pieces that are made on order anyway.
- **Silent variant deletes today** (section 4.3) can already leave removed options live; fixing it changes behaviour admins may be used to.
- **Invoice Arabic**: Prawn output for Arabic variant names needs a check before relying on it.
