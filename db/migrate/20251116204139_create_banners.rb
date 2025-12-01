class CreateBanners < ActiveRecord::Migration[8.0]
  def change
    create_table :banners do |t|
      t.string :image, null: false
      t.string :title_en
      t.string :title_ar
      t.string :subtitle_en
      t.string :subtitle_ar
      t.boolean :active, default: true, null: false
      t.integer :position, default: 0
      t.references :product, foreign_key: true
      t.string :url

      t.timestamps
    end

    add_index :banners, :active
    add_index :banners, :position
  end
end
