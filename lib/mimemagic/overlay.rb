# Stub overlay for mimemagic to avoid missing data errors in minimal environments
class MimeMagic
  module Overlay
    def self.load; end
  end
end

MimeMagic::Overlay.load
