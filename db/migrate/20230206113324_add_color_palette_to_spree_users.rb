class AddColorPaletteToSpreeUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_users, :color_palette, :integer
  end
end
