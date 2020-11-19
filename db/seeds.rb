# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Droping database...'
Cocktail.destroy_all

puts 'Creating new cocktails...'
20.times do
  ingredient = Ingredient.create(
    {
      name: Faker::Food.ingredient

    }
  )
  puts "Added #{ingredient.name}"
end

10.times do
  cocktail = Cocktail.create(
    {
      name: Faker::FunnyName.three_word_name

    }
  )
  puts "Created #{cocktail.name}"
end

10.times do
  dose = Dose.create(
    {
      description: Faker::Food.measurement,
      cocktail_id: rand(1..10),
      ingredient_id: rand(1..20)

    }
  )
  puts "Added #{dose.description}"
end
