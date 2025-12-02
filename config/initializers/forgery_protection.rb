# Allow requests from nginx proxy on port 8000
Rails.application.config.action_controller.forgery_protection_origin_check = false

# Set default URL options globally for all environments
Rails.application.routes.default_url_options = { host: '161.97.162.62', port: 8000, protocol: 'http' }

# Ensure all URL helpers include the port
Rails.application.config.to_prepare do
  Rails.application.routes.default_url_options = { host: '161.97.162.62', port: 8000, protocol: 'http' }
end
