class AddLikesCountToSpreeProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_products, :likes_count, :integer
  end
end
