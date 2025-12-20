class AddOthersToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :others, :string
  end
end
