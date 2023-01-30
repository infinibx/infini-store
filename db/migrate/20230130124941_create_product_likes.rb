class CreateProductLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_likes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :product, null: false

      t.foreign_key :spree_users, column: :user_id, on_delete: :cascade
      t.foreign_key :spree_products, column: :product_id, on_delete: :cascade

      t.timestamps
    end
  end
end
