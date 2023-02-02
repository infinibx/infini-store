class AddClothingToSpreeVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_variants, :clothing, :boolean, default: true
  end
end
