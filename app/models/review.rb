class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
	validates_associated :product, :user
end
