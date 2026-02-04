class InvoiceGenerator
  def initialize(order)
    @order = order
  end

  def render
    pdf = Prawn::Document.new(page_size: "A4", margin: 40)

    # Header Section with Brand
    pdf.fill_color "1C2434"
    pdf.font_size(28) do
      pdf.text current_settings.store_name.upcase, style: :bold, align: :center
    end
    pdf.fill_color "000000"
    pdf.move_down 5
    pdf.font_size(10) do
      pdf.text "Fine Jewelry & Luxury Accessories", align: :center, style: :italic
    end

    pdf.move_down 20
    pdf.stroke_horizontal_rule
    pdf.move_down 20

    # Invoice Title and Order Info
    pdf.fill_color "1C2434"
    pdf.font_size(24) do
      pdf.text "INVOICE", style: :bold
    end
    pdf.fill_color "000000"
    pdf.move_down 10

    # Order Details Box
    pdf.bounding_box([0, pdf.cursor], width: 250) do
      pdf.font_size(10) do
        pdf.text "Order Number: ##{@order.id}", style: :bold
        pdf.text "Date: #{@order.created_at.strftime('%B %d, %Y')}"
        pdf.text "Status: #{@order.status.titleize}"
      end
    end

    # Customer & Shipping Info Side by Side
    pdf.bounding_box([300, pdf.cursor + 60], width: 240) do
      pdf.fill_color "1C2434"
      pdf.font_size(11) do
        pdf.text "BILL TO", style: :bold
      end
      pdf.fill_color "000000"
      pdf.move_down 5
      pdf.font_size(10) do
        pdf.text @order.name, style: :bold
        pdf.text @order.email
        pdf.text @order.phone
      end
    end

    pdf.move_down 80

    pdf.fill_color "1C2434"
    pdf.font_size(11) do
      pdf.text "SHIP TO", style: :bold
    end
    pdf.fill_color "000000"
    pdf.move_down 5
    pdf.font_size(10) do
      if @order.street_address.present?
        pdf.text @order.street_address
        pdf.text @order.building if @order.building.present?
        pdf.text [@order.city, @order.postal_code].compact_blank.join(", ")
        pdf.text @order.country
      else
        pdf.text @order.address_text
        pdf.text "#{@order.city}, #{@order.country}"
      end
    end

    pdf.move_down 30

    # Items Table
    pdf.fill_color "1C2434"
    pdf.font_size(12) do
      pdf.text "ORDER ITEMS", style: :bold
    end
    pdf.fill_color "000000"
    pdf.move_down 10

    table_data = [["PRODUCT", "QTY", "UNIT PRICE", "TOTAL"]]
    @order.order_items.each do |item|
      product_name = item.product.name_en || item.product.name_ar || "Product"
      # Add variant info if available
      if item.product_variant
        product_name += "\n#{item.product_variant.display_name}"
      end
      table_data << [
        product_name,
        item.quantity.to_s,
        as_currency(item.unit_price),
        as_currency(item.line_total)
      ]
    end

    pdf.table(table_data, width: pdf.bounds.width, cell_style: { border_width: 0.5, border_color: "DDDDDD" }) do
      # Header row styling
      row(0).background_color = "F3F4F6"
      row(0).font_style = :bold
      row(0).text_color = "1C2434"
      row(0).padding = [8, 8]

      # Data rows styling
      cells.padding = [8, 8]
      cells.size = 10

      # Align columns
      column(1..3).align = :right
      column(0).width = 280
    end

    pdf.move_down 30

    # Summary Section (Right Aligned)
    summary_y_position = pdf.cursor
    pdf.bounding_box([pdf.bounds.width - 220, summary_y_position], width: 220) do
      # Subtotal
      pdf.stroke do
        pdf.horizontal_line 0, 220
      end
      pdf.move_down 10

      summary_items = [
        ["Subtotal:", as_currency(@order.subtotal)]
      ]

      # Add shipping
      summary_items << ["Shipping (DHL Express):", as_currency(@order.shipping_amount)]

      # Add discount if applicable
      if @order.discount_amount > 0
        pdf.fill_color "059669"
        summary_items << ["Discount (#{@order.coupon_code}):", "-#{as_currency(@order.discount_amount)}"]
        pdf.fill_color "000000"
      end

      summary_items.each do |label, value|
        pdf.text_box label, at: [0, pdf.cursor], width: 140, align: :left, size: 10
        pdf.text_box value, at: [140, pdf.cursor], width: 80, align: :right, size: 10
        pdf.move_down 18
      end

      # Total
      pdf.move_down 5
      pdf.stroke do
        pdf.horizontal_line 0, 220
      end
      pdf.move_down 10

      pdf.fill_color "1C2434"
      pdf.font_size(14) do
        pdf.text_box "TOTAL:", at: [0, pdf.cursor], width: 140, align: :left, style: :bold
        pdf.text_box as_currency(@order.total_amount), at: [140, pdf.cursor], width: 80, align: :right, style: :bold
      end
      pdf.fill_color "000000"
      pdf.move_down 20

      pdf.font_size(8) do
        pdf.text "All prices include applicable taxes", align: :right, color: "6B7280"
      end
    end

    # Footer
    pdf.move_down 60
    pdf.stroke_horizontal_rule
    pdf.move_down 15

    pdf.fill_color "1C2434"
    pdf.font_size(12) do
      pdf.text "Thank you for your purchase!", align: :center, style: :bold
    end
    pdf.fill_color "6B7280"
    pdf.move_down 5
    pdf.font_size(9) do
      pdf.text "For any inquiries, please contact us", align: :center
    end
    pdf.fill_color "000000"

    pdf.render
  end

  private

  def as_currency(amount)
    currency = @order.currency.presence || "USD"
    symbol = ExchangeRateService.symbol_for(currency)
    precision = ExchangeRateService.three_decimal?(currency) ? 3 : 2
    ActionController::Base.helpers.number_to_currency(amount, unit: symbol, precision: precision)
  end

  def current_settings
    Setting.current
  end
end
