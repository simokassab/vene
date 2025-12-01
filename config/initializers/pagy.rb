# Pagy initializer file (https://ddnexus.github.io/pagy/docs/api/pagy#global-vars)

# Set default items per page
Pagy::DEFAULT[:items] = 20

# Better user experience handled automatically
require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page
