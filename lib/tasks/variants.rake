namespace :variants do
  desc "Copy each single-option variant into product_variant_options, set its signature and " \
       "give every option a slug. Safe to run more than once. " \
       "Usage: bin/rails variants:backfill_options [DRY_RUN=1]"
  task backfill_options: :environment do
    dry_run = ENV["DRY_RUN"].present?
    created = 0
    slugged = 0

    ActiveRecord::Base.transaction do
      VariantOption.where(slug: nil).find_each do |option|
        option.send(:generate_slug)
        puts "  slug #{option.variant_type_id}/#{option.value} -> #{option.slug}" if dry_run
        option.update_columns(slug: option.slug) unless dry_run
        slugged += 1
      end

      ProductVariant.where.not(variant_option_id: nil).where(option_signature: nil)
                    .where.missing(:product_variant_options).find_each do |variant|
        puts "  variant #{variant.id} (product #{variant.product_id}) -> option #{variant.variant_option_id}" if dry_run
        unless dry_run
          ProductVariantOption.create!(product_variant_id: variant.id, variant_type_id: variant.variant_type_id,
                                       variant_option_id: variant.variant_option_id)
          variant.update_columns(option_signature: variant.variant_option_id.to_s)
        end
        created += 1
      end

      raise ActiveRecord::Rollback if dry_run
    end

    legacy = ProductVariant.where(variant_option_id: nil).where.missing(:product_variant_options).count
    puts "#{dry_run ? 'Would create' : 'Created'} #{created} option rows; slugged #{slugged} options."
    puts "Legacy name/value variants left as they are: #{legacy}." if legacy.positive?
  end
end
