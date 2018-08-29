class ProductsController < ApplicationController

	def index
		@products = Product.search(params).page(params[:page]).per(6)
		@accessories = Accessory.all.page(params[:page]).per(10)
	end
end
