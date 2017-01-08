class ProductsController < ApplicationController

	def new
		@product = Product.new
		@categories = Category.all
		@product.reviews.build
	end

	def show
		if Product.find_by(id: params[:product_id])
			@product = Product.find_by(id: params[:product_id])
		else
			@product = Product.find_by(id: params[:id])
		end
	end

	def create
		@product = Product.find_or_initialize_by(name: params[:product][:name])
		@brand = Brand.find_or_create_by(name: params[:product][:brand])
		@product.brand_id = @brand.id
		@product.category_id = params[:product][:category_id]
		if @product.save
			@product.reviews.create(
												user_id: current_user.id, 
												product_id: @product.id, 
												rating: params[:product]["reviews_attributes"]["0"]["rating"], 
												comment: params[:product]["reviews_attributes"]["0"]["comment"]
												)
			redirect_to product_path(@product)
		else
			@errors = @product.errors.full_messages
			render :new
		end
	end

	private

	def product_params
		params.require(:product).permit(:category_id, :brand, :name, :reviews_attributes)
	end
end