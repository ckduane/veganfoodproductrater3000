class ProductsController < ApplicationController

	def new
		@product = Product.new
		@categories = Category.all
	end

	def show
		if Product.find_by(id: params[:product_id])
			@product = Product.find_by(id: params[:product_id])
		else
			@product = Product.find_by(id: params[:id])
		end
	end

	def create
		@product = Product.new
		@brand = Brand.find_or_create_by(name: params[:product][:brand])
		@product.brand_id = @brand.id
		@product.name = params[:product][:name]
		@product.category_id = params[:product][:category_id]
		if @product.save
			redirect_to product_path(@product)
		else
			@errors = @product.errors.full_messages
			render :new
		end
	end

	private

	def product_params
		params.require(:product).permit(:category_id, :brand, :name)
	end
end