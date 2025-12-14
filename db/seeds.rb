admin = User.find_or_initialize_by(email: "admin@example.com")
admin.update!(password: "password123", password_confirmation: "password123", role: "admin", name: "Admin", phone: "+96100000000")
puts "Admin created: #{admin.email} / password123"

settings = Setting.current
settings.update!(store_name: "VENE Jewelry", local_tax_rate: 11, international_tax_rate: 0, shipping_flat_rate: 20, default_currency: "USD", whatsapp_phone_number: "1234567890", local_country: "Lebanon")
puts "Settings ensured"

categories = %w[Necklaces Bracelets Rings Earrings]
categories.each do |cat|
  Category.find_or_create_by!(slug: cat.parameterize) do |c|
    c.name_en = cat
    c.name_ar = cat # placeholder
    c.active = true
  end
end
puts "Categories seeded"

# Create subcategories
subcategory_data = {
  "Necklaces" => [
    { en: "Pendants", ar: "قلائد" },
    { en: "Chains", ar: "سلاسل" },
    { en: "Chokers", ar: "قلادات قصيرة" }
  ],
  "Bracelets" => [
    { en: "Bangles", ar: "أساور صلبة" },
    { en: "Chain Bracelets", ar: "أساور سلسلة" },
    { en: "Cuff Bracelets", ar: "أساور واسعة" }
  ],
  "Rings" => [
    { en: "Engagement Rings", ar: "خواتم الخطوبة" },
    { en: "Wedding Bands", ar: "دبل الزفاف" },
    { en: "Fashion Rings", ar: "خواتم الموضة" }
  ],
  "Earrings" => [
    { en: "Studs", ar: "أقراط صغيرة" },
    { en: "Hoops", ar: "أقراط دائرية" },
    { en: "Dangles", ar: "أقراط متدلية" }
  ]
}

Category.find_each do |category|
  names = subcategory_data[category.name_en] || [
    { en: "General", ar: "عام" }
  ]

  names.each_with_index do |name, index|
    SubCategory.find_or_create_by!(
      category: category,
      slug: "#{category.slug}-#{name[:en].parameterize}"
    ) do |sc|
      sc.name_en = name[:en]
      sc.name_ar = name[:ar]
      sc.position = index
      sc.active = true
    end
  end
end
puts "Subcategories seeded"

Page.find_or_create_by!(slug: "terms-and-conditions") do |p|
  p.title_en = "Terms and Conditions"
  p.title_ar = "الشروط والأحكام"
  p.content_en = "Add your terms here"
  p.content_ar = ""
  p.active = true
end
Page.find_or_create_by!(slug: "privacy-policy") do |p|
  p.title_en = "Privacy Policy"
  p.title_ar = "سياسة الخصوصية"
  p.content_en = "Add your privacy policy here"
  p.content_ar = ""
  p.active = true
end
Page.find_or_create_by!(slug: "delivery-and-return-policy") do |p|
  p.title_en = "Delivery and Return Policy"
  p.title_ar = "سياسة التسليم والإرجاع"
  p.content_en = "Add your delivery and return policy here"
  p.content_ar = ""
  p.active = true
end

first_subcategory = SubCategory.first
if first_subcategory
  Product.find_or_create_by!(slug: "classic-necklace") do |product|
    product.name_en = "Classic Necklace"
    product.name_ar = "قلادة كلاسيكية"
    product.description_en = "Elegant gold necklace."
    product.description_ar = "قلادة ذهبية أنيقة."
    product.price = 500
    product.sub_category = first_subcategory
    product.stock_quantity = 5
    product.metal = "18k Gold"
    product.diamonds = "VS1"
    product.gemstones = ""
  end
end

puts "Sample product seeded"
