// Product page state: gallery, quantity and the variant picker.
//
// A product sells combinations (Yellow gold + 52). The picker shows one row per type;
// choosing the photo type (Color) swaps the gallery to that color's photos. Once every
// row has a choice, the matching variant feeds the purchase logic, which is unchanged
// from before: stock, made to order, WhatsApp and add to bag all read selectedVariant.
export default function productPage(config) {
  const picker = config.picker || { types: [], variants: [], images: { shared: [], byOption: {} } }
  const allImages = config.images || []

  return {
    activeImage: config.primaryUrl || "",
    gallery: allImages,
    quantity: 1,
    selectedVariant: null,
    showImageModal: false,
    imageZoom: false,
    zoomX: 0,
    zoomY: 0,
    viewingVideo: false,
    hasVariants: config.hasVariants,
    productStockQuantity: config.product.stock,
    productAllowPreorder: config.product.allowPreorder,
    productEstimatedDate: config.product.estimatedDate,
    // Made to order: driven by the flag alone, never by stock level.
    productPreorderOnly: config.product.madeToOrder,

    // Simple properties, not getters, to avoid reactivity issues
    currentStock: config.product.stock,
    currentMaxQty: config.product.stock,
    currentIsPreorder: config.product.madeToOrder,
    currentCanPurchase: config.product.purchasable,
    currentEstimatedDate: config.product.estimatedDate,

    types: picker.types,
    variants: picker.variants,
    selected: {},
    combinationMissing: false,

    init() {
      this.pickInitialColor()
      this.$watch("selectedVariant", () => { this.quantity = 1 })
      this.$watch("quantity", (value) => {
        if (this.currentMaxQty > 0 && value > this.currentMaxQty) this.quantity = this.currentMaxQty
        if (value < 1) this.quantity = 1
      })
      this.preloadColors()
    },

    // ---------- Picker ----------

    imageType() {
      return this.types.find((t) => t.drivesImages)
    },

    // ?color= wins, then the default color (Yellow gold), then the first color in stock.
    // Only the photo type is preselected: a size is always the customer's choice.
    pickInitialColor() {
      const type = this.imageType()
      if (!type) {
        // A row with a single option has nothing to choose.
        this.types.filter((t) => t.options.length === 1).forEach((t) => { this.selected[t.id] = t.options[0].id })
        this.resolveVariant()
        return
      }
      const slug = new URLSearchParams(window.location.search).get("color")
      const option =
        type.options.find((o) => o.slug === slug) ||
        type.options.find((o) => o.default) ||
        type.options.find((o) => this.optionState(type.id, o.id) === "ok") ||
        type.options[0]
      this.selected[type.id] = option.id
      this.types.filter((t) => t.id !== type.id && t.options.length === 1).forEach((t) => { this.selected[t.id] = t.options[0].id })
      this.showColor(option.id, false)
      this.resolveVariant()
    },

    choose(typeId, optionId) {
      this.selected[typeId] = optionId
      const type = this.types.find((t) => t.id === typeId)
      if (type && type.drivesImages) this.showColor(optionId, true)
      this.resolveVariant()
    },

    isChosen(typeId, optionId) {
      return this.selected[typeId] === optionId
    },

    chosenLabel(typeId) {
      const type = this.types.find((t) => t.id === typeId)
      const option = type && type.options.find((o) => o.id === this.selected[typeId])
      return option ? option.label : ""
    },

    // "ok": a purchasable variant has this option together with the other current choices.
    // "soldout": such variants exist but none can be bought. "none": no such combination.
    optionState(typeId, optionId) {
      const others = Object.entries(this.selected)
        .filter(([id, value]) => Number(id) !== typeId && value != null)
        .map(([, value]) => value)
      const matches = this.variants.filter((v) => v.options.includes(optionId) && others.every((o) => v.options.includes(o)))
      if (matches.length === 0) return "none"
      return matches.some((v) => v.purchasable) ? "ok" : "soldout"
    },

    allChosen() {
      return this.types.every((t) => this.selected[t.id] != null)
    },

    resolveVariant() {
      this.combinationMissing = false
      if (!this.hasVariants || !this.allChosen()) {
        this.selectedVariant = null
      } else {
        const ids = this.types.map((t) => this.selected[t.id])
        const variant = this.variants.find((v) => v.options.length === ids.length && ids.every((id) => v.options.includes(id)))
        this.selectedVariant = variant ? variant.id : null
        this.combinationMissing = !variant
      }
      this.updateCurrentState()
    },

    missingTypeNames() {
      return this.types.filter((t) => this.selected[t.id] == null).map((t) => t.name)
    },

    // ---------- Gallery ----------

    showColor(optionId, updateUrl) {
      const own = picker.images.byOption[optionId] || []
      const images = own.length || picker.images.shared.length ? own.concat(picker.images.shared) : allImages
      this.gallery = images
      this.activeImage = images[0] || this.activeImage
      this.imageZoom = false
      this.viewingVideo = false
      if (updateUrl) {
        const type = this.imageType()
        const option = type && type.options.find((o) => o.id === optionId)
        if (option) {
          const url = new URL(window.location.href)
          url.searchParams.set("color", option.slug)
          window.history.replaceState(window.history.state, "", url)
        }
      }
    },

    // Switching color should feel instant: warm the first photo of every color.
    preloadColors() {
      Object.values(picker.images.byOption).forEach((list) => {
        if (list[0]) new Image().src = list[0]
      })
    },

    // ---------- Purchase logic ----------

    updateCurrentState() {
      const variant = this.variants.find((v) => v.id === this.selectedVariant)
      if (this.hasVariants && variant) {
        this.currentStock = variant.stock
        // OR-semantics, mirroring Product#made_to_order_with?
        this.currentIsPreorder = variant.madeToOrder
        this.currentCanPurchase = variant.purchasable
        this.currentMaxQty = variant.stock
        this.currentEstimatedDate = variant.deliveryDate || ""
      } else if (this.hasVariants) {
        // Until the combination is complete the page shows the product's own state, but
        // made to order only when every variant of the product is made to order.
        this.currentStock = 0
        this.currentIsPreorder = this.productPreorderOnly
        this.currentCanPurchase = !this.combinationMissing
        this.currentMaxQty = 0
        this.currentEstimatedDate = this.productEstimatedDate
      } else {
        this.currentStock = this.productStockQuantity
        this.currentIsPreorder = this.productPreorderOnly
        this.currentCanPurchase = this.productStockQuantity > 0 || this.productAllowPreorder
        this.currentMaxQty = this.productStockQuantity
        this.currentEstimatedDate = this.productEstimatedDate
      }
    },

    incrementQuantity() {
      if (this.quantity < this.currentMaxQty) this.quantity++
    },

    decrementQuantity() {
      if (this.quantity > 1) this.quantity--
    },

    handleMouseMove(e) {
      const rect = e.currentTarget.getBoundingClientRect()
      this.zoomX = ((e.clientX - rect.left) / rect.width) * 100
      this.zoomY = ((e.clientY - rect.top) / rect.height) * 100
    },
  }
}
