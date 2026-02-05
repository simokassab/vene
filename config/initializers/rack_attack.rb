# frozen_string_literal: true

class Rack::Attack
  ### Configure Cache ###
  # Use Rails cache store (solid_cache in production)
  Rack::Attack.cache.store = Rails.cache

  ### Safelists ###
  # Allow requests from localhost in development
  safelist("allow-localhost") do |req|
    req.ip == "127.0.0.1" || req.ip == "::1"
  end

  ### Throttles ###

  # General request throttle - 300 requests per 5 minutes per IP
  throttle("req/ip", limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?("/assets", "/up")
  end

  # Login throttle - by email (5 attempts per 20 seconds)
  throttle("logins/email", limit: 5, period: 20.seconds) do |req|
    if req.path.match?(%r{/users/sign_in|/admin/sign_in}) && req.post?
      req.params.dig("user", "email")&.downcase&.strip
    end
  end

  # Login throttle - by IP (20 attempts per 5 minutes)
  throttle("logins/ip", limit: 20, period: 5.minutes) do |req|
    if req.path.match?(%r{/users/sign_in|/admin/sign_in}) && req.post?
      req.ip
    end
  end

  # Admin login throttle - stricter (5 attempts per 15 minutes)
  throttle("admin_logins/ip", limit: 5, period: 15.minutes) do |req|
    if req.path.match?(%r{/admin/sign_in}) && req.post?
      req.ip
    end
  end

  # Password reset throttle - 3 per hour per IP
  throttle("password_reset/ip", limit: 3, period: 1.hour) do |req|
    if req.path.match?(%r{/password}) && req.post?
      req.ip
    end
  end

  # Registration throttle - 5 per hour per IP
  throttle("registrations/ip", limit: 5, period: 1.hour) do |req|
    if req.path.match?(%r{/users/sign_up|/users$}) && req.post?
      req.ip
    end
  end

  # Checkout throttle - 30 per hour per IP
  throttle("checkout/ip", limit: 30, period: 1.hour) do |req|
    if req.path.match?(%r{/checkout}) && req.post?
      req.ip
    end
  end

  # Coupon apply throttle - 10 per 5 minutes per IP
  throttle("coupon/ip", limit: 10, period: 5.minutes) do |req|
    if req.path.match?(%r{/cart/apply_coupon}) && req.post?
      req.ip
    end
  end

  # Webhook throttle - 100 per minute per IP (higher for automated systems)
  throttle("webhooks/ip", limit: 100, period: 1.minute) do |req|
    if req.path.match?(%r{/payments/webhook})
      req.ip
    end
  end

  ### Blocklists ###

  # Block suspicious request patterns
  blocklist("block-bad-actors") do |req|
    # Block requests with suspicious user agents
    bad_patterns = [
      /sqlmap/i,
      /nikto/i,
      /nmap/i,
      /masscan/i,
      /zgrab/i
    ]
    req.user_agent && bad_patterns.any? { |pattern| req.user_agent.match?(pattern) }
  end

  ### Custom Responses ###

  # Return 429 with Retry-After header
  self.throttled_responder = lambda do |request|
    match_data = request.env["rack.attack.match_data"]
    now = match_data[:epoch_time]
    retry_after = match_data[:period] - (now % match_data[:period])

    [
      429,
      {
        "Content-Type" => "application/json",
        "Retry-After" => retry_after.to_s
      },
      [{ error: "Rate limit exceeded. Retry in #{retry_after} seconds." }.to_json]
    ]
  end

  # Log blocked and throttled requests
  ActiveSupport::Notifications.subscribe("throttle.rack_attack") do |_name, _start, _finish, _id, payload|
    req = payload[:request]
    Rails.logger.warn(
      "[Rack::Attack][Throttled] " \
      "ip=#{req.ip} " \
      "path=#{req.path} " \
      "matched=#{req.env['rack.attack.matched']}"
    )
  end

  ActiveSupport::Notifications.subscribe("blocklist.rack_attack") do |_name, _start, _finish, _id, payload|
    req = payload[:request]
    Rails.logger.warn(
      "[Rack::Attack][Blocked] " \
      "ip=#{req.ip} " \
      "path=#{req.path} " \
      "matched=#{req.env['rack.attack.matched']}"
    )
  end
end
