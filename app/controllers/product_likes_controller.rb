class ProductLikesController < StoreController
  helper 'spree/products', 'spree/products_likes'

  def create
    # @product = find_product(params[:product_id])
    # @like = ProductLike.new(product: @product, user: current_user)

    # if @like.save
    #   render :show, status: :no_content
    # else
    #   invalid_resource!(@like)
    # end
  end
end
