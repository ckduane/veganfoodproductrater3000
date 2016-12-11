class Product < ActiveRecord::Base
	belongs_to :brand
	belongs_to :category
	has_many :reviews

	validates_associated :brand
end
