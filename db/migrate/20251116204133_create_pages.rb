class CreatePages < ActiveRecord::Migration[8.0]
  def change
    create_table :pages do |t|
      t.string :title_en, null: false
      t.string :title_ar, null: false
      t.string :slug, null: false
      t.text :content_en
      t.text :content_ar
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :pages, :slug, unique: true
  end
end
