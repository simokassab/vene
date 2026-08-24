module AnalyticsHelper
  # Renders a <script> that pushes a GA4 ecommerce event onto the dataLayer.
  # Accepts a payload Hash (page-load events) or a pre-serialized JSON String
  # (flash-stashed events that survive a redirect).
  #
  # The JSON is run through json_escape so a product name containing "</script>"
  # cannot break out of the tag.
  def ga4_data_layer(payload)
    return if payload.blank?

    json = payload.is_a?(String) ? payload : payload.to_json
    js = "window.dataLayer=window.dataLayer||[];" \
         "window.dataLayer.push({ecommerce:null});" \
         "window.dataLayer.push(#{ERB::Util.json_escape(json)});"

    content_tag(:script, js.html_safe)
  end

  # Renders a GA4 event stashed in the flash after a redirect
  # (used for add_to_cart and purchase). No-op when nothing is stashed.
  def ga4_flash_event
    ga4_data_layer(flash[:ga4_event])
  end

  # Renders a <script> that fires a Meta (Facebook) Pixel standard event.
  # Accepts the {event:, data:} Hash from the MetaPixel service (page-load
  # events) or a pre-serialized JSON String (flash-stashed events that survive
  # a redirect).
  #
  # The name and params are run through json_escape so a product name
  # containing "</script>" cannot break out of the tag. `window.fbq &&` guards
  # against the pixel being blocked (ad blockers) so we never raise on the page.
  def meta_pixel_event(payload)
    return if payload.blank?

    payload = JSON.parse(payload) if payload.is_a?(String)
    payload = payload.symbolize_keys
    name = payload[:event]
    return if name.blank?

    args = [ name.to_json, (payload[:data].presence && payload[:data].to_json) ]
             .compact.map { |json| ERB::Util.json_escape(json) }.join(",")

    content_tag(:script, "window.fbq && fbq('track',#{args});".html_safe)
  end

  # Renders a Meta Pixel event stashed in the flash after a redirect
  # (used for AddToCart and Purchase). No-op when nothing is stashed.
  def meta_pixel_flash_event
    meta_pixel_event(flash[:meta_pixel_event])
  end
end
