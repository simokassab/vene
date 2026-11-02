# Where the hero crops a banner photo, as a percentage from the left (0 left edge,
# 50 centre, 100 right edge). Wide photos shown in the hero's tall box lose their sides.
class AddImageFocusToBanners < ActiveRecord::Migration[8.0]
  def change
    add_column :banners, :image_focus, :integer, default: 50, null: false
  end
end
