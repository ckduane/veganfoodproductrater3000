categories = ['dairy', 'meats', 'condiments', 'premade', 'snacks', 'candy']

categories.each do |category|
	Category.create!(name: category)
end

brands = ['Follow your Heart', 'Field Roast', 'Tofurkey', 'Tofutti']

brands.each do |brand|
	Brand.create!(name: brand)
end

Product.create!(
				category_id: 3,
				brand_id: 1,
				name: 'Vegenaise',
				)

Product.create!(
				category_id: 2,
				brand_id: 2,
				name: 'Apple Sage Sausages',
				)

Product.create!(
				category_id: 2,
				brand_id: 3,
				name: 'Beer Brats',
				)

Product.create!(
				category_id: 1,
				brand_id: 4,
				name: 'Better than Cream Cheese',
				)

user = User.new
user.email = 'christine@test.com'
user.password = '123456'
user.password_confirmation = '123456'
user.save!

user1 = User.new
user1.email = 'test@test.com'
user1.password = '123456'
user1.password_confirmation = '123456'
user1.save!

Review.create!(
				rating: 5,
				comment: 'Tofutti cream cheese is near and dear to my heart. It is the first vegan cream cheese I tried and I\'ve been eating it ever since! Has a chemically flavor, but hey! it\'s better than being bland!',
				product_id: 4,
				user_id: 1
				)

Review.create!(
				rating: 1,
				comment: 'Gross. Tastes like chemicals',
				product_id: 4,
				user_id: 2
				)