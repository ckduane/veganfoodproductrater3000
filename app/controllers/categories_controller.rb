class CategoriesController < ApplicationController
	def show
		@category = Category.find_by(id: params[:category_id])
	end
end