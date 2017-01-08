class ReviewsController < ApplicationController
	before_action :authenticate_user!

	def new
		@review = Review.new
		@product = Product.new
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.product_id = find_product.id
		if @review.save
			redirect_to product_path(find_product)
		else
			@errors = @review.errors.full_messages
			render :new
		end
	end

	def edit
		@product = find_product
		@review = find_review
		@categories = Category.all
	end

	private

	def review_params
		params.require(:review).permit(:user_id, :product_id, :rating, :comment)
	end

	def find_product
		Product.find_by(id: params[:product_id])
	end

	def find_review
		Review.find_by(id: params[:id])
	end
end