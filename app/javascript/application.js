import "@hotwired/turbo-rails"
import Alpine from "alpinejs"
import intersect from "@alpinejs/intersect"
import productPage from "components/product_page"
import variantMatrix from "components/variant_matrix"

Alpine.plugin(intersect)
Alpine.data("productPage", productPage)
Alpine.data("variantMatrix", variantMatrix)
window.Alpine = Alpine
Alpine.start()
