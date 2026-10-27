// Admin variant grid: choose the types (Color, Ring size, Stone…), the options of each,
// and get one row per combination with its own stock and made-to-order settings.
// Rows keep their edits while options are toggled, keyed by the sorted option ids, which
// is the same signature the server stores on the variant.
const LARGE_GRID = 150

export default function variantMatrix(data) {
  return {
    types: data.types,
    selectedTypes: data.selectedTypes,
    selectedOptions: Object.fromEntries(data.types.map((t) => [t.id, data.selectedOptions[t.id] || []])),
    rows: data.rows,
    bulkStock: "",
    filterOption: "",
    openGroups: {},

    typeOn(typeId) {
      return this.selectedTypes.includes(typeId)
    },

    toggleType(typeId) {
      if (this.typeOn(typeId)) {
        this.selectedTypes = this.selectedTypes.filter((id) => id !== typeId)
      } else {
        this.selectedTypes = this.types.filter((t) => t.id === typeId || this.typeOn(t.id)).map((t) => t.id)
      }
    },

    optionOn(typeId, optionId) {
      return this.selectedOptions[typeId].includes(optionId)
    },

    toggleOption(typeId, optionId) {
      const list = this.selectedOptions[typeId]
      this.selectedOptions[typeId] = list.includes(optionId) ? list.filter((id) => id !== optionId) : list.concat(optionId)
    },

    allOptions(typeId, on) {
      const type = this.types.find((t) => t.id === typeId)
      this.selectedOptions[typeId] = on ? type.options.map((o) => o.id) : []
    },

    // Chosen types with at least one option, in type order.
    activeTypes() {
      return this.types.filter((t) => this.typeOn(t.id) && this.selectedOptions[t.id].length > 0)
    },

    groupType() {
      return this.activeTypes().find((t) => t.drivesImages) || null
    },

    combinations() {
      const types = this.activeTypes()
      if (types.length === 0) return []
      let combos = [[]]
      types.forEach((type) => {
        const options = type.options.filter((o) => this.optionOn(type.id, o.id))
        combos = combos.flatMap((combo) => options.map((option) => combo.concat(option)))
      })
      return combos.map((options) => {
        const ids = options.map((o) => o.id)
        const key = ids.slice().sort((a, b) => a - b).join("-")
        return { key, ids, options, row: this.row(key) }
      })
    },

    row(key) {
      if (!this.rows[key]) this.rows[key] = { id: null, stock: 0, preorder: false, active: true, date: "" }
      return this.rows[key]
    },

    // Grouped under the color when there is one, so 81 rows read as three blocks.
    groups() {
      const type = this.groupType()
      const filter = Number(this.filterOption) || null
      const combos = this.combinations().filter((c) => !filter || c.ids.includes(filter))
      if (!type) return [{ id: "all", label: "", swatch: null, combos }]
      return type.options
        .filter((o) => this.optionOn(type.id, o.id))
        .map((o) => ({ id: o.id, label: o.label, swatch: o.swatch, combos: combos.filter((c) => c.ids.includes(o.id)) }))
        .filter((g) => g.combos.length > 0)
    },

    groupOpen(id) {
      return this.openGroups[id] !== false
    },

    toggleGroup(id) {
      this.openGroups[id] = !this.groupOpen(id)
    },

    // Options of the other types, shown as columns next to the group.
    columnTypes() {
      const group = this.groupType()
      return this.activeTypes().filter((t) => !group || t.id !== group.id)
    },

    labelFor(combo, typeId) {
      const type = this.types.find((t) => t.id === typeId)
      const option = combo.options.find((o) => type.options.some((to) => to.id === o.id))
      return option ? option.label : ""
    },

    count() {
      return this.combinations().length
    },

    inStockCount() {
      return this.combinations().filter((c) => c.row.active && (Number(c.row.stock) > 0 || c.row.preorder)).length
    },

    tooLarge() {
      return this.count() > LARGE_GRID
    },

    setStock(groupId) {
      const value = Math.max(0, parseInt(this.bulkStock, 10) || 0)
      this.combinations()
        .filter((c) => groupId == null || c.ids.includes(groupId))
        .forEach((c) => { c.row.stock = value })
    },

    setMadeToOrder(on) {
      this.combinations().forEach((c) => { c.row.preorder = on })
    },
  }
}
