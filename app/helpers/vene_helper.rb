# View helpers for the VENÈ design system (docs/design/vene). Partials under
# app/views/shared/vene compose these; pages compose the partials.
module VeneHelper
  # 1.25px line icons on a 24px grid, square caps, no fills (Icon.dc.html).
  ICON_PATHS = {
    bag: [ "M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z", "M3 6h18", "M16 10a4 4 0 0 1-8 0" ],
    heart: [ "M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" ],
    user: [ "M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2", "M8 7a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" ],
    search: [ "M4 11a7 7 0 1 0 14 0a7 7 0 1 0 -14 0", "m20 20-4-4" ],
    message: [ "M7.9 20A9 9 0 1 0 4 16.1L2 22Z" ],
    check: [ "M20 6 9 17l-5-5" ],
    plus: [ "M5 12h14", "M12 5v14" ],
    minus: [ "M5 12h14" ],
    close: [ "M18 6 6 18", "m6 6 12 12" ],
    truck: [ "M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2", "M15 18H9",
            "M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.62l-3.48-4.35A1 1 0 0 0 17.52 8H14",
            "M15 18a2 2 0 1 0 4 0a2 2 0 1 0 -4 0", "M5 18a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" ],
    package: [ "m7.5 4.27 9 5.15",
              "M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z",
              "m3.3 7 8.7 5 8.7-5", "M12 22V12" ],
    lock: [ "M3 11h18v11H3Z", "M7 11V7a5 5 0 0 1 10 0v4" ],
    gem: [ "M6 3h12l4 6-10 13L2 9Z", "M11 3 8 9l4 13 4-13-3-6", "M2 9h20" ],
    diamond: [ "M6 3h12l4 6-10 13L2 9Z", "M2 9h20" ],
    shield: [ "M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z",
             "m9 12 2 2 4-4" ],
    list: [ "M3 5h18", "M3 12h18", "M3 19h12" ],
    refresh: [ "M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8", "M3 3v5h5" ],
    arrow: [ "M5 12h14", "m13 6 6 6-6 6" ],
    menu: [ "M3 7h18", "M3 12h18", "M3 17h18" ],
    chevron: [ "m6 9 6 6 6-6" ],
    download: [ "M12 3v12", "m7 10 5 5 5-5", "M5 21h14" ],
    trash: [ "M3 6h18", "M8 6V4h8v2", "M5 6l1 15h12l1-15" ],
    edit: [ "M4 20h4L19 9l-4-4L4 16Z", "m13 7 4 4" ],
    eye: [ "M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7-10-7-10-7Z", "M9 12a3 3 0 1 0 6 0a3 3 0 1 0 -6 0" ],
    grid: [ "M3 3h7v7H3Z", "M14 3h7v7h-7Z", "M3 14h7v7H3Z", "M14 14h7v7h-7Z" ],
    settings: [ "M4 6h16", "M4 12h16", "M4 18h16", "M9 4v4", "M15 10v4", "M7 16v4" ],
    tag: [ "M3 3h8l10 10-8 8L3 11Z", "M7.5 7.5h.01" ],
    file: [ "M6 2h9l5 5v15H6Z", "M14 2v6h6" ],
    image: [ "M3 3h18v18H3Z", "m3 16 5-5 5 5", "m13 14 3-3 5 5", "M15 8h.01" ],
    logout: [ "M9 21H4V3h5", "m16 17 5-5-5-5", "M21 12H9" ],
    external: [ "M14 3h7v7", "M21 3 10 14", "M19 14v7H3V5h7" ],
    calendar: [ "M3 5h18v16H3Z", "M3 10h18", "M8 3v4", "M16 3v4" ],
    globe: [ "M3 12a9 9 0 1 0 18 0a9 9 0 1 0 -18 0", "M3 12h18", "M12 3a14 14 0 0 1 0 18a14 14 0 0 1 0-18" ]
  }.freeze

  ICON_TONES = {
    current: nil, gold: "text-gold", success: "text-success", danger: "text-danger", muted: "text-ink-muted"
  }.freeze

  def vn_icon(name, size: 24, stroke: 1.25, tone: :current, filled: false, css: nil, label: nil)
    paths = ICON_PATHS.fetch(name.to_sym) { ICON_PATHS[:bag] }
    classes = [ "block flex-none", ICON_TONES[tone.to_sym], css ].compact.join(" ")
    aria = label ? { role: "img", "aria-label": label } : { "aria-hidden": "true" }

    content_tag(:svg, safe_join(paths.map { |d| tag.path(d: d) }),
                width: size, height: size, viewBox: "0 0 24 24",
                fill: filled ? "currentColor" : "none", stroke: "currentColor",
                "stroke-width": stroke, "stroke-linecap": "square", "stroke-linejoin": "miter",
                class: classes, focusable: "false", **aria)
  end

  # Prices, sizes and SKUs stay LTR in Latin digits inside Arabic text.
  def vn_bdi(value, css: nil)
    tag.bdi(value, class: [ "font-latin vn-num", css ].compact.join(" "))
  end

  def vn_price(amount, css: nil)
    vn_bdi(display_price(amount, compact: true), css: [ "vn-price", css ].compact.join(" "))
  end

  def vn_order_price(amount, order, css: nil)
    vn_bdi(display_order_price(amount, order, compact: true), css: [ "vn-price", css ].compact.join(" "))
  end

  def vn_arabic?
    I18n.locale.to_sym == :ar
  end

  # The → glyph, mirrored for RTL (README: arrows mirror in RTL).
  def vn_arrow
    vn_arabic? ? "←" : "→"
  end

  MegaMenu = Data.define(:category, :sub_categories, :products)
  MEGA_MENU_PICKS = 4

  # SiteHeader mega menu: per category, its live subcategories and up to four pieces
  # (featured first). Builds from navigation_categories, which already preloads
  # sub_categories: :products, then loads images for the picked pieces in one query.
  def vn_mega_menus
    @vn_mega_menus ||= begin
      menus = navigation_categories.map do |category|
        subs = category.sub_categories
                       .select { |sc| sc.active? && sc.products.any?(&:active?) }
                       .sort_by { |sc| [ sc.position || 999, sc.name_en.to_s ] }
        live = subs.flat_map(&:products).select(&:active?)
        picks = (live.select(&:featured?) + live).uniq.first(MEGA_MENU_PICKS)
        MegaMenu.new(category:, sub_categories: subs, products: picks)
      end
      ActiveRecord::Associations::Preloader.new(records: menus.flat_map(&:products),
                                                associations: :product_images).call
      menus
    end
  end

  def vn_product_image_url(product, version: :medium)
    image = product.primary_image&.image
    return if image.blank?

    version ? image.public_send(version).url : image.url
  end

  FLASH_MESSAGE_KEYS = %w[notice alert error success info warning].freeze

  # Only human-readable messages: analytics payloads (ga4_event, meta_pixel_event, …) also
  # travel in the flash and are rendered by their own helpers.
  def vn_flash_messages
    flash.to_hash.slice(*FLASH_MESSAGE_KEYS).select { |_, v| v.is_a?(String) && v.present? }
  end

  # Flash keys → Notice tones. Devise and the app use notice/alert; anything else is a note.
  def vn_flash_tone(key)
    case key.to_s
    when "alert", "error" then :error
    when "notice", "success" then :success
    else :note
    end
  end

  def vn_status_label(status)
    t("vene.status.#{status}", default: status.to_s.humanize)
  end

  def vn_payment_status_label(status)
    t("vene.payment_status.#{status}", default: status.to_s.humanize)
  end

  # Wrapped in Unicode isolates (LRI … PDI) so "#12" stays in order inside Arabic text,
  # including plain-text contexts such as <title> where <bdi> cannot be used.
  def vn_order_number(order)
    "\u2066#{t('vene.orders.number_prefix')}#{order.id}\u2069"
  end

  # PolicyLayout: give each <h2> of admin-authored page content an id and list them for the
  # table of contents. Content is trusted as before (pages are written in the admin).
  def vn_prose_with_toc(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html.to_s)
    toc = doc.css("h2").each_with_index.map do |heading, index|
      heading["id"] ||= "section-#{index + 1}"
      [ heading["id"], heading.text.squish ]
    end
    [ doc.to_html.html_safe, toc ] # rubocop:disable Rails/OutputSafety
  end

  # Order and payment statuses → Badge tones.
  def vn_status_tone(status)
    case status.to_s
    when "paid", "delivered", "shipped" then "noir"
    when "canceled", "cancelled", "failed" then "danger"
    when "pending", "payment_pending" then "outline"
    else "gold"
    end
  end
end
