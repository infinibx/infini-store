class AddClothingToSpreeProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_products, :clothing, :boolean
  end
end
