class InvoiceGenerator
  def initialize(order)
    @order = order
  end

  def render
    Prawn::Document.new(page_size: "A4") do |pdf|
      pdf.text current_settings.store_name, size: 20, style: :bold
      pdf.move_down 10
      pdf.text "Order ##{@order.id} - #{@order.created_at.to_date}"
      pdf.text "Customer: #{@order.name}"
      pdf.text "Email: #{@order.email}"
      pdf.text "Phone: #{@order.phone}"
      pdf.move_down 10
      pdf.text "Shipping Address: #{@order.address}, #{@order.city}, #{@order.country}"
      pdf.move_down 10

      pdf.text "Items", style: :bold
      data = [["Product", "Qty", "Unit", "Total"]]
      @order.order_items.each do |item|
        data << [item.product.name, item.quantity, as_currency(item.unit_price), as_currency(item.line_total)]
      end
      pdf.table(data, header: true)

      pdf.move_down 10
      pdf.text "Subtotal: #{as_currency(@order.subtotal)}"
      pdf.text "Tax: #{as_currency(@order.tax_amount)}"
      pdf.text "Shipping: #{as_currency(@order.shipping_amount)}"
      pdf.text "Total: #{as_currency(@order.total_amount)}", style: :bold
      pdf.render
    end
  end

  private

  def as_currency(amount)
    ActionController::Base.helpers.number_to_currency(amount, unit: current_settings.default_currency)
  end

  def current_settings
    Setting.current
  end
end
