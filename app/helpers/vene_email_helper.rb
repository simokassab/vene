# Table-based building blocks for the VENÈ emails (EmailLayout / EmailPurchase artboards).
# Mail clients ignore CSS variables and most stylesheets, so the ivory palette from
# ds/vene/tokens.json lives here once and every style is inlined. Fonts fall back to
# Georgia / Helvetica where Cormorant Garamond and Jost are not installed.
module VeneEmailHelper
  EMAIL_COLORS = {
    surface: "#faf7f2", raised: "#ffffff", sunken: "#f3ede4", noir: "#131313", noir_ground: "#0f0e0d",
    line: "#e4dccf", ink: "#131313", muted: "#5c544a", subtle: "#766b5e", on_noir: "#f4efe7",
    on_noir_muted: "#b4aa9b", gold: "#c5a059", gold_text: "#7d5c24", gold_on_noir: "#e2c690",
    gold_soft: "#f1e7d4", success: "#2e6a4e", danger: "#a3322b"
  }.freeze

  EMAIL_SERIF = "'Cormorant Garamond', Garamond, Georgia, 'Times New Roman', serif".freeze
  EMAIL_SANS = "Jost, Futura, 'Helvetica Neue', Helvetica, Arial, sans-serif".freeze
  EMAIL_ARABIC = "'IBM Plex Sans Arabic', Tahoma, Arial, sans-serif".freeze
  EMAIL_ARABIC_SERIF = "Amiri, 'Traditional Arabic', Georgia, serif".freeze

  def vn_email_color(name) = EMAIL_COLORS.fetch(name)

  def vn_email_rtl? = I18n.locale.to_sym == :ar

  def vn_email_sans = vn_email_rtl? ? EMAIL_ARABIC : EMAIL_SANS

  def vn_email_serif = vn_email_rtl? ? EMAIL_ARABIC_SERIF : EMAIL_SERIF

  def vn_email_align = vn_email_rtl? ? "right" : "left"

  def vn_email_align_end = vn_email_rtl? ? "left" : "right"

  # One full-width band of the 600px card.
  def vn_email_section(ground: :surface, padding: "48px 56px", &block)
    tag.tr do
      tag.td(capture(&block), style: "background-color: #{vn_email_color(ground)}; padding: #{padding}; " \
                                     "text-align: #{vn_email_align}; font-family: #{vn_email_sans}; color: #{vn_email_color(:ink)};")
    end
  end

  # Uppercase and tracked in Latin; Arabic is never tracked or uppercased.
  def vn_email_eyebrow(text, tone: :gold_text)
    type = vn_email_rtl? ? "font-size: 14px; line-height: 22px;" : "font-size: 11px; line-height: 16px; letter-spacing: 0.32em; text-transform: uppercase;"
    tag.p(text, style: "margin: 0 0 16px; font-family: #{vn_email_sans}; font-weight: 500; #{type} color: #{vn_email_color(tone)};")
  end

  def vn_email_title(text, size: 52, color: :ink)
    weight = vn_email_rtl? ? 700 : 300
    tag.h1(text, style: "margin: 0 0 20px; font-family: #{vn_email_serif}; font-weight: #{weight}; font-size: #{size}px; " \
                        "line-height: #{(size * 1.1).round}px; color: #{vn_email_color(color)};")
  end

  def vn_email_heading(text)
    tag.h2(text, style: "margin: 0 0 24px; font-family: #{vn_email_serif}; font-weight: #{vn_email_rtl? ? 700 : 500}; " \
                        "font-size: 24px; line-height: 32px; color: #{vn_email_color(:ink)};")
  end

  def vn_email_text(content = nil, muted: true, size: 16, &block)
    tag.p(content || capture(&block), style: "margin: 0 0 16px; font-family: #{vn_email_sans}; font-size: #{size}px; " \
                                             "line-height: #{(size * 1.7).round}px; font-weight: 300; " \
                                             "color: #{vn_email_color(muted ? :muted : :ink)};")
  end

  # Noir block button; the primary action of the email.
  def vn_email_button(label, href)
    type = vn_email_rtl? ? "font-size: 15px;" : "font-size: 12px; letter-spacing: 0.2em; text-transform: uppercase;"
    tag.table(role: "presentation", cellpadding: 0, cellspacing: 0, border: 0, style: "margin: 8px 0 0;") do
      tag.tr do
        tag.td(style: "background-color: #{vn_email_color(:noir)};") do
          link_to(label, href, style: "display: inline-block; padding: 16px 36px; font-family: #{vn_email_sans}; font-weight: 500; " \
                                      "#{type} color: #{vn_email_color(:on_noir)}; text-decoration: none;")
        end
      end
    end
  end

  # A hairline-ruled row of label / value pairs (order number, date, carrier …).
  def vn_email_meta(pairs)
    label_type = vn_email_rtl? ? "font-size: 13px;" : "font-size: 11px; letter-spacing: 0.24em; text-transform: uppercase;"
    tag.table(role: "presentation", width: "100%", cellpadding: 0, cellspacing: 0, border: 0,
              style: "margin: 8px 0 24px; border-top: 1px solid #{vn_email_color(:line)}; border-bottom: 1px solid #{vn_email_color(:line)};") do
      tag.tr do
        safe_join(pairs.map do |label, value|
          tag.td(style: "padding: 16px 0; vertical-align: top; text-align: #{vn_email_align};") do
            tag.span(label, style: "display: block; font-family: #{vn_email_sans}; #{label_type} color: #{vn_email_color(:muted)};") +
              tag.span(value, style: "display: block; padding-top: 2px; font-family: #{vn_email_sans}; font-size: 15px; color: #{vn_email_color(:ink)};")
          end
        end)
      end
    end
  end

  def vn_email_line_item(name:, price:, image: nil, meta: nil, detail: nil)
    tag.table(role: "presentation", width: "100%", cellpadding: 0, cellspacing: 0, border: 0, style: "margin: 0 0 20px;") do
      tag.tr do
        thumb = if image
                  tag.td(image_tag(image, alt: name, width: 88, height: 88,
                                          style: "display: block; width: 88px; height: 88px; border: 1px solid #{vn_email_color(:line)}; background-color: #ffffff;"),
                         width: 104, style: "width: 104px; vertical-align: top;")
        end
        body = tag.td(style: "vertical-align: top; text-align: #{vn_email_align};") do
          safe_join([
            tag.span(name, style: "display: block; font-family: #{vn_email_serif}; font-weight: #{vn_email_rtl? ? 700 : 500}; font-size: 20px; line-height: 26px; color: #{vn_email_color(:ink)};"),
            (tag.span(meta, style: "display: block; padding-top: 2px; font-family: #{vn_email_sans}; font-size: 12px; line-height: 18px; #{'letter-spacing: 0.12em; text-transform: uppercase; ' unless vn_email_rtl?}color: #{vn_email_color(:muted)};") if meta.present?),
            (tag.span(detail, style: "display: block; padding-top: 2px; font-family: #{vn_email_sans}; font-size: 13px; line-height: 20px; color: #{vn_email_color(:muted)};") if detail.present?)
          ].compact)
        end
        amount = tag.td(tag.bdi(price), style: "vertical-align: top; white-space: nowrap; text-align: #{vn_email_align_end}; " \
                                                "font-family: #{EMAIL_SANS}; font-size: 15px; letter-spacing: 0.04em; color: #{vn_email_color(:ink)};")
        safe_join([ thumb, body, amount ].compact)
      end
    end
  end

  # rows: [[label, value], …]; the last argument is the total row.
  def vn_email_totals(rows, total_label:, total:)
    cell = "padding: 5px 0; font-family: #{vn_email_sans}; font-size: 15px; line-height: 24px;"
    tag.table(role: "presentation", width: "100%", cellpadding: 0, cellspacing: 0, border: 0, style: "margin: 8px 0 0;") do
      lines = rows.map do |label, value|
        tag.tr do
          tag.td(label, style: "#{cell} text-align: #{vn_email_align}; color: #{vn_email_color(:muted)};") +
            tag.td(tag.bdi(value), style: "#{cell} text-align: #{vn_email_align_end}; color: #{vn_email_color(:ink)}; letter-spacing: 0.04em;")
        end
      end
      total_row = tag.tr do
        tag.td(total_label, style: "padding: 16px 0 0; border-top: 1px solid #{vn_email_color(:ink)}; text-align: #{vn_email_align}; " \
                                   "font-family: #{vn_email_serif}; font-weight: #{vn_email_rtl? ? 700 : 500}; font-size: 24px; color: #{vn_email_color(:ink)};") +
          tag.td(tag.bdi(total), style: "padding: 16px 0 0; border-top: 1px solid #{vn_email_color(:ink)}; text-align: #{vn_email_align_end}; " \
                                        "font-family: #{EMAIL_SANS}; font-size: 18px; letter-spacing: 0.04em; color: #{vn_email_color(:ink)};")
      end
      safe_join(lines + [ total_row ])
    end
  end

  # Absolute URL of a product's thumbnail; uploads are served from the app host.
  def vn_email_image_url(product, variant: nil)
    path = (variant&.primary_image || product.primary_image)&.image&.thumb&.url
    URI.join(root_url, path).to_s if path.present?
  end

  # Wishlist alerts are priced in USD (a mailer has no visitor currency).
  def vn_email_usd(amount)
    number_to_currency(amount, unit: "$", precision: (amount.to_d % 1).zero? ? 0 : 2)
  end

  # Email prices: the order's own currency, whole amounts without decimals.
  def vn_email_order_price(amount, order)
    display_order_price(amount, order, compact: true)
  end
end
