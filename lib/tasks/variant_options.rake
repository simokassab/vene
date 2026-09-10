namespace :variant_options do
  desc "Extend a numeric variant type (e.g. Ring Size) down to FROM, filling any gaps and " \
       "renumbering positions so the values stay in numeric order. " \
       "Usage: bin/rails variant_options:extend_sizes FROM=48 [TO=70] [TYPE='Ring Size'] [DRY_RUN=1]"
  task extend_sizes: :environment do
    from    = Integer(ENV.fetch("FROM", 48))
    dry_run = ENV["DRY_RUN"].present?

    type =
      if ENV["TYPE"].present?
        VariantType.find_by(name: ENV["TYPE"]) ||
          abort("No variant type named #{ENV['TYPE'].inspect}. Available: #{VariantType.pluck(:name).join(', ')}")
      else
        matches = VariantType.where("name ILIKE ?", "%size%").to_a
        case matches.length
        when 0 then abort("No variant type matching 'size'. Available: #{VariantType.pluck(:name).join(', ')}")
        when 1 then matches.first
        else abort("Several size variant types (#{matches.map(&:name).join(', ')}). Re-run with TYPE=...")
        end
      end

    numeric, other = type.variant_options.partition { |o| o.value.to_s.strip.match?(/\A\d+\z/) }
    puts "Variant type: #{type.name} (#{numeric.size} numeric options, #{other.size} non-numeric)"
    puts "Leaving non-numeric options alone: #{other.map(&:value).join(', ')}" if other.any?

    to = ENV["TO"].present? ? Integer(ENV["TO"]) : numeric.map { |o| o.value.to_i }.max
    abort("No numeric options to extend, and no TO given.") if to.nil?
    abort("FROM (#{from}) is greater than TO (#{to}).") if from > to

    have    = numeric.map { |o| o.value.to_i }.sort
    missing = (from..to).to_a - have
    puts "Current range: #{have.min}-#{have.max} (#{have.size} options)" if have.any?
    puts missing.any? ? "Adding: #{missing.join(', ')}" : "No values to add."

    ActiveRecord::Base.transaction do
      created = missing.map do |value|
        type.variant_options.create!(value: value.to_s, active: true, position: 0)
      end

      # Renumber so the `ordered` scope (position, value) sorts numerically.
      by_value = (numeric + created).index_by { |o| o.value.to_i }
      by_value.keys.sort.each_with_index do |value, index|
        option = by_value[value]
        next if option.position == index + 1
        puts "  #{value}: position #{option.position} -> #{index + 1}"
        option.update!(position: index + 1)
      end

      raise ActiveRecord::Rollback if dry_run
    end

    if dry_run
      puts "DRY_RUN - rolled back, nothing was written."
    else
      puts "Done. #{type.name}: #{type.variant_options.ordered.pluck(:value).join(', ')}"
    end
  end
end
