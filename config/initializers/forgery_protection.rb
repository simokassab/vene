# Allow requests from nginx proxy on port 8000
Rails.application.config.action_controller.forgery_protection_origin_check = false

# Or alternatively, configure allowed request origins
# Rails.application.config.action_controller.allow_forgery_protection = true
# Rails.application.config.hosts << "161.97.162.62:8000"
