# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
url_file = open(url).read
@ingredients = JSON.parse(url_file)
@ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

15.times do
  url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  url_file = open(url).read
  @drinks = JSON.parse(url_file)
  @name = @drinks['drinks'][0]['strDrink']
  @photo_url = @drinks['drinks'][0]['strDrinkThumb']
  file = URI.open(@photo_url)
  cocktail = Cocktail.create(
    {
      name: @name
    }
  )
  cocktail.photo.attach(io: file, filename: 'new.jpg', content_type: 'image/jpg')
end

60.times do
  Dose.create(
    {
      description: Faker::Food.measurement,
      cocktail_id: rand(1..15),
      ingredient_id: rand(1..100)
    }
  )
end
