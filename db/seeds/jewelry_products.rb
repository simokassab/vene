# Jewelry Products Seeder
puts "🎨 Creating categories and products..."

# Create categories
categories_data = [
  { name_en: "Rings", name_ar: "خواتم", description_en: "Beautiful rings for every occasion", description_ar: "خواتم جميلة لكل مناسبة" },
  { name_en: "Necklaces", name_ar: "قلائد", description_en: "Elegant necklaces to enhance your style", description_ar: "قلائد أنيقة لتعزيز أناقتك" },
  { name_en: "Bracelets", name_ar: "أساور", description_en: "Stylish bracelets for your wrist", description_ar: "أساور أنيقة لمعصمك" },
  { name_en: "Earrings", name_ar: "أقراط", description_en: "Stunning earrings to complete your look", description_ar: "أقراط رائعة لإكمال إطلالتك" }
]

categories = categories_data.map do |cat_data|
  Category.find_or_create_by!(name_en: cat_data[:name_en]) do |category|
    category.name_ar = cat_data[:name_ar]
    category.description_en = cat_data[:description_en]
    category.description_ar = cat_data[:description_ar]
    category.active = true
  end
end

puts "✅ Created #{categories.count} categories"

# Products data with public image URLs
products_data = [
  # Rings
  {
    category: "Rings",
    products: [
      { name_en: "Diamond Solitaire Ring", name_ar: "خاتم الماس سوليتير", price: 2999.99, image: "https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=800" },
      { name_en: "Gold Band Ring", name_ar: "خاتم ذهبي", price: 899.99, image: "https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=800" },
      { name_en: "Sapphire Engagement Ring", name_ar: "خاتم خطوبة ياقوت", price: 3499.99, image: "https://images.unsplash.com/photo-1603561596112-0a132b757442?w=800" },
      { name_en: "Pearl Cluster Ring", name_ar: "خاتم عنقود اللؤلؤ", price: 1299.99, image: "https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=800" }
    ]
  },
  # Necklaces
  {
    category: "Necklaces",
    products: [
      { name_en: "Diamond Pendant Necklace", name_ar: "قلادة ماس معلقة", price: 1899.99, image: "https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=800" },
      { name_en: "Pearl Strand Necklace", name_ar: "قلادة لؤلؤ", price: 1499.99, image: "https://images.unsplash.com/photo-1506630448388-4e683c67ddb0?w=800" },
      { name_en: "Gold Chain Necklace", name_ar: "قلادة سلسلة ذهبية", price: 799.99, image: "https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=800" },
      { name_en: "Emerald Drop Necklace", name_ar: "قلادة زمرد متدلية", price: 2299.99, image: "https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=800" }
    ]
  },
  # Bracelets
  {
    category: "Bracelets",
    products: [
      { name_en: "Diamond Tennis Bracelet", name_ar: "سوار تنس الماس", price: 3999.99, image: "https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=800" },
      { name_en: "Gold Bangle Bracelet", name_ar: "سوار ذهبي", price: 1199.99, image: "https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=800" },
      { name_en: "Charm Bracelet", name_ar: "سوار بحلي", price: 699.99, image: "https://images.unsplash.com/photo-1573408301185-9146fe634ad0?w=800" },
      { name_en: "Pearl Bracelet", name_ar: "سوار لؤلؤ", price: 899.99, image: "https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=800" }
    ]
  },
  # Earrings
  {
    category: "Earrings",
    products: [
      { name_en: "Diamond Stud Earrings", name_ar: "أقراط ماس", price: 1599.99, image: "https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=800" },
      { name_en: "Pearl Drop Earrings", name_ar: "أقراط لؤلؤ متدلية", price: 799.99, image: "https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=800" },
      { name_en: "Gold Hoop Earrings", name_ar: "أقراط حلقات ذهبية", price: 599.99, image: "https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=800" },
      { name_en: "Emerald Dangle Earrings", name_ar: "أقراط زمرد متدلية", price: 1899.99, image: "https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=800" }
    ]
  }
]

require 'open-uri'

products_data.each do |category_data|
  category = categories.find { |c| c.name_en == category_data[:category] }

  category_data[:products].each do |product_data|
    product = Product.find_or_create_by!(
      name_en: product_data[:name_en],
      category: category
    ) do |p|
      p.name_ar = product_data[:name_ar]
      p.description_en = "Exquisite #{product_data[:name_en].downcase} crafted with precision and care."
      p.description_ar = "قطعة رائعة مصنوعة بدقة وعناية"
      p.price = product_data[:price]
      p.stock_quantity = 50
      p.active = true
      p.slug = product_data[:name_en].parameterize
    end

    # Add product image from URL
    if product.product_images.empty?
      begin
        # Use placeholder.com for reliable placeholder images
        image_url = "https://via.placeholder.com/800x800/E5E7EB/6B7280?text=#{URI.encode_www_form_component(product.name_en)}"
        downloaded_image = URI.open(image_url)
        product_image = product.product_images.build(position: 0)
        product_image.image = downloaded_image
        product_image.save!
        puts "  ✅ Added image for #{product.name_en}"
      rescue => e
        puts "  ⚠️  Failed to download image for #{product.name_en}: #{e.message}"
      end
    end
  end

  puts "✅ Created products for #{category_data[:category]}"
end

puts "🎉 Seeding completed! Created products with images from Unsplash."
