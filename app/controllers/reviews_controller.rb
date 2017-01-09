class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_review, only: [:edit, :update, :destroy ]
	before_action :find_product, except: :create

	def new
		@review = Review.new
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
	end

	def update
		respond_to do |format|
			if @review.update(review_params)
				format.html { redirect_to @product, notice: 'Review was successfully updated.' }
				format.json { render :show, status: :ok, location: @review }
			else
				format.html { render :edit }
				format.json { render json: @review.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@review.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Review was successfully deleted.' }
      format.json { head :no_content }
    end
  end

	private

	def review_params
		params.require(:review).permit(:user_id, :product_id, :rating, :comment)
	end

	def find_product
		@product = Product.find_by(id: params[:product_id])
	end

	def find_review
		@review = Review.find_by(id: params[:id])
	end
end