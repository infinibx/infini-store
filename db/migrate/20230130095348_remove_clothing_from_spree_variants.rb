class RemoveClothingFromSpreeVariants < ActiveRecord::Migration[7.0]
  def change
    remove_column :spree_variants, :clothing, :boolean
  end
end
