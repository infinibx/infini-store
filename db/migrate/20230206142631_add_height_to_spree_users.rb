class AddHeightToSpreeUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_users, :height, :integer
  end
end
