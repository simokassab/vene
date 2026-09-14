namespace :sub_categories do
  COLOURS = [ "Rose Gold", "White Gold", "Yellow Gold" ].freeze

  desc "Move products out of inactive subcategories into the active same-category subcategory " \
       "matching their metal colour, so the storefront sidebar counts add up. " \
       "Usage: bin/rails sub_categories:rehome_inactive [DRY_RUN=1]"
  task rehome_inactive: :environment do
    dry_run = ENV["DRY_RUN"].present?

    stranded = Product.where(active: true)
                      .joins(:sub_category)
                      .where(sub_categories: { active: false })
                      .includes(:sub_category)
                      .order(:sub_category_id, :id)

    if stranded.empty?
      puts "Nothing to do - no active products sit in an inactive subcategory."
      next
    end

    # Active subcategories, grouped by category, so a product can only ever be
    # rehomed inside its own category.
    targets = SubCategory.where(active: true).group_by(&:category_id)

    moves = []
    skipped = []

    stranded.each do |product|
      colour = COLOURS.find { |c| product.metal.to_s.match?(/#{c.split.first}/i) }
      target = colour && targets.fetch(product.sub_category.category_id, [])
                               .find { |sc| sc.name_en.to_s.match?(/\A#{colour}/i) }

      if target
        moves << [ product, target ]
      else
        skipped << [ product, colour ]
      end
    end

    puts "Found #{stranded.size} active product(s) in inactive subcategories."
    puts

    moves.group_by { |product, target| [ product.sub_category.name_en, target.name_en ] }
         .sort_by { |(from, to), _| [ from, to ] }
         .each { |(from, to), group| puts format("  %-30s -> %-30s %3d", from, to, group.size) }

    if skipped.any?
      puts
      puts "Leaving #{skipped.size} product(s) alone - no matching active subcategory:"
      skipped.each do |product, colour|
        reason = colour ? "no active #{colour} subcategory in its category" : "metal #{product.metal.inspect} matched no colour"
        puts "  ##{product.id} #{product.name_en} (#{reason})"
      end
    end

    ActiveRecord::Base.transaction do
      moves.each { |product, target| product.update!(sub_category_id: target.id) }
      raise ActiveRecord::Rollback if dry_run
    end

    puts
    if dry_run
      puts "DRY_RUN - rolled back, nothing was written."
    else
      puts "Done. Moved #{moves.size} product(s)."
    end
  end
end
