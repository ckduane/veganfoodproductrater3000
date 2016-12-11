module ReviewHelper
	def avg_rating(reviews)
		sum = reviews.pluck(:rating).reduce(:+)
		sum / reviews.count.to_f.round(1)
	end
end