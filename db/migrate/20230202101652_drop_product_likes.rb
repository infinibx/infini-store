class DropProductLikes < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_likes
  end
end
