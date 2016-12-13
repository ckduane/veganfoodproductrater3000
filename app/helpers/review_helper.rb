module ReviewHelper
	def avg_rating(reviews)
		sum = reviews.pluck(:rating).reduce(:+)
		sum / reviews.count.to_f.round(1)
	end

	def has_reviews?
		!@product.reviews.empty?
	end

	def left_review?
		found_review = Review.find_by(user_id: current_user.id, product_id: @product.id)
		found_review == nil ? false : true
	end
end