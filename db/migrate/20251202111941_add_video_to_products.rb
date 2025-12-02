class AddVideoToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :video, :string
  end
end
