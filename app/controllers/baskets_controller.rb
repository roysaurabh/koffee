class BasketsController < ApplicationController


	def create
		#add this product in the basket

		#:product_id because we're in a nested resource
		#so not :id because we're nt talking abt a basket
		@product = Product.find(params[:product_id])

		#lets add this product id to the basket
		basket.add(@product.id)

		#lets tell the user
		flash[:success]= "Item added to the basket"

		#go back to the product show page
		redirect_to product_path(@product)
	end

	def destroy
		#remove this product from the basket
		#:product_id because we're in a nested resource
		#so not :id because we're nt talking abt a basket
		@product = Product.find(params[:product_id])

		#lets add this product id to the basket
		basket.delete(@product.id)

		#lets tell the user
		flash[:success]= "Item removed to the basket"

		#go back to the product show page
		redirect_to product_path(@product)
	end
end
