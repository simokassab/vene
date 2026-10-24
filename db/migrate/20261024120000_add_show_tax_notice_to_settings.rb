class AddShowTaxNoticeToSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :settings, :show_tax_notice, :boolean, null: false, default: false
  end
end
