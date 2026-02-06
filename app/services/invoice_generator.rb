class InvoiceGenerator
  def initialize(order)
    @order = order
  end

  def render
    pdf = Prawn::Document.new(page_size: "A4", margin: 40)

    render_header(pdf)
    render_invoice_info(pdf)
    render_items_table(pdf)
    render_summary(pdf)
    render_footer(pdf)

    pdf.render
  end

  private

  def render_header(pdf)
    logo_path = Rails.root.join("app", "assets", "images", "logo.jpg")
    logo_height = 80

    # Company info on the left
    top = pdf.cursor
    pdf.bounding_box([0, top], width: 340) do
      pdf.fill_color "000000"
      pdf.font_size(16) { pdf.text "GOLDEN ARCH FOR COMMERCIAL", style: :bold }
      pdf.move_down 4
      pdf.font_size(12) { pdf.text "VENÈ JEWELRY", style: :bold }
      pdf.fill_color "666666"
      pdf.font_size(9) { pdf.text "Born in Beirut, Made for the World", style: :italic }
      pdf.move_down 12
      pdf.fill_color "000000"
      pdf.font_size(9) do
        pdf.text "+961 78729590"
        pdf.move_down 3
        pdf.text "1100 BEIRUT, LEBANON"
      end
    end

    # Logo on the right
    if File.exist?(logo_path)
      pdf.image logo_path, at: [pdf.bounds.width - 120, top], width: 120, height: logo_height
    end

    pdf.move_down 50
  end

  def render_invoice_info(pdf)
    top = pdf.cursor

    # Left side: Invoice details
    pdf.bounding_box([0, top], width: 260) do
      pdf.fill_color "000000"
      pdf.font_size(18) { pdf.text "INVOICE", style: :bold }
      pdf.move_down 18
      pdf.font_size(10) do
        pdf.text "Order Number: ##{@order.id}", style: :bold
        pdf.move_down 10
        pdf.text "Date: #{@order.created_at.strftime('%B %d, %Y')}", style: :bold
        pdf.move_down 10
        pdf.text "Status: #{@order.status.titleize}", style: :bold
      end
    end

    # Right side: Billed To
    pdf.bounding_box([280, top], width: 240) do
      pdf.fill_color "000000"
      pdf.font_size(12) { pdf.text "BILLED TO", style: :bold }
      pdf.move_down 18
      pdf.font_size(10) do
        pdf.text @order.name, style: :bold
        pdf.move_down 8
        pdf.text @order.email
        pdf.move_down 8
        pdf.text @order.phone if @order.phone.present?
      end
    end

    pdf.move_down 50
  end

  def render_items_table(pdf)
    table_data = [["Description", "Quantity", "Unit Price", "Cost"]]

    @order.order_items.each do |item|
      product_name = item.product.name_en || item.product.name_ar || "Product"
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

    pdf.fill_color "000000"

    pdf.table(table_data, width: pdf.bounds.width, cell_style: { borders: [:bottom], border_width: 0.5, border_color: "DDDDDD", padding: [12, 10] }) do
      # Header row
      row(0).background_color = "333333"
      row(0).text_color = "FFFFFF"
      row(0).font_style = :bold
      row(0).size = 10
      row(0).borders = [:bottom]
      row(0).border_width = 0

      # Data rows
      cells.size = 10

      # Column widths and alignment
      column(0).width = pdf.bounds.width * 0.45
      column(1).align = :center
      column(2).align = :center
      column(3).align = :center
    end

    pdf.move_down 30
  end

  def render_summary(pdf)
    summary_width = 250
    x_offset = pdf.bounds.width - summary_width

    summary_items = [
      ["Subtotal", as_currency(@order.subtotal)]
    ]

    shipping_label = "Shipping (#{@order.shipping_method.presence || 'DHL'} EXPRESS)"
    summary_items << [shipping_label, as_currency(@order.shipping_amount)]

    if @order.discount_amount.to_f > 0
      summary_items << ["Discount (#{@order.coupon_code})", "-#{as_currency(@order.discount_amount)}"]
    end

    pdf.fill_color "000000"

    summary_items.each do |label, value|
      pdf.font_size(10) do
        pdf.text_box label, at: [x_offset, pdf.cursor], width: 170, align: :right
        pdf.text_box value, at: [x_offset + 170, pdf.cursor], width: 80, align: :right
      end
      pdf.move_down 24
    end

    # Total line
    pdf.stroke do
      pdf.horizontal_line x_offset, pdf.bounds.width
    end
    pdf.move_down 14

    pdf.font_size(12) do
      pdf.text_box "Total", at: [x_offset, pdf.cursor], width: 170, align: :right, style: :bold
      pdf.text_box as_currency(@order.total_amount), at: [x_offset + 170, pdf.cursor], width: 80, align: :right, style: :bold
    end

    pdf.move_down 50
  end

  def render_footer(pdf)
    pdf.fill_color "000000"
    pdf.font_size(10) do
      pdf.move_down 4
      pdf.text "Thank you for choosing from our jewelry collection and stepping into the"
      pdf.move_down 2
      pdf.text "<b>WORLD OF VENÈ</b> — where every piece is crafted to mirror your grace,", inline_format: true
      pdf.move_down 2
      pdf.text "your story, and your timeless elegance."
    end
  end

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
