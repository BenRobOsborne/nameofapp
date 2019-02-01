# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: "YT Capra 29 CF Pro", description: "Rated best value for under $5000", color: "Red", price: "$4400.00", image: "mbike9.jpeg")
Comment.create!(user: User.first, product: Product.first, rating: 2, body: "Not so good")
Comment.create!(user: User.first, product: Product.second, rating: 4, body: "This is a very nice bike.")
Comment.create!(user: User.first, product: Product.second, rating: 5, body: "Fantastic Bike!")
Comment.create!(user: User.first, product: Product.second, rating: 3, body: "This is one amazing bike!")
Comment.create!(user: User.first, product: Product.third, rating: 4, body: "This is a very nice bike")
Comment.create!(user: User.first, product: Product.third, rating: 5, body: "Fantastic Bike!")
Comment.create!(user: User.first, product: Product.third, rating: 4, body: "This is a very nice bike")
Comment.create!(user: User.first, product: Product.third, rating: 2, body: "I was actually disapointed..")
