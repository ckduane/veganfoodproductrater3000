categories = ['dairy', 'meats', 'condiments', 'premade', 'snacks', 'candy']

categories.each do |category|
	Category.create!(name: category)
end