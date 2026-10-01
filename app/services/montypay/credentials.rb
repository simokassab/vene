module Montypay
  # Hardcoded by request of the store owner (previously stored in Setting, where the
  # admin password field could silently blank the password on save).
  module Credentials
    MERCHANT_KEY = "0273b8d0-f5f5-11f0-a4b3-4abd771c38bb".freeze
    PASSWORD = "4b468a3f5ef81b4330681aadc445f215".freeze
  end
end
