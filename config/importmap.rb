# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "alpinejs", to: "https://cdn.jsdelivr.net/npm/alpinejs@3.15.0/dist/module.esm.js", preload: true
pin "@alpinejs/intersect", to: "https://cdn.jsdelivr.net/npm/@alpinejs/intersect@3.15.0/dist/module.esm.js"
