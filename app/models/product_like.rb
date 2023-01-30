class ProductLike < ApplicationRecord
  belongs_to :user, class_name: 'Spree::User'
  belongs_to :product, class_name: 'Spree::Product'

  validates :user, uniqueness: { scope: product_id }

  belongs_to :product, class_name: 'Spree::Product', counter_cache: :likes_count
end
