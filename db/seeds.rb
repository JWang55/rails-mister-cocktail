# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

# Dose.destroy_all
# Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all


puts"Creating new Ingredients...."
url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
ingredients_raw = open(url).read
recipes = JSON.parse(ingredients_raw)

recipes.each do |recipe|
  puts recipe["name"]
  Cocktail.create(name: recipe["name"])
  recipe["ingredients"].each do |ingredient|
    puts ingredient["ingredient"]
    Ingredient.create(name: ingredient["ingredient"])
    # Dose.create(name: ingredient)
  end
end
# puts ingredients
# ingredients["drinks"].each do |e|
#   # puts e["strIngredient1"]
#   Ingredient.create(name:e["strIngredient1"])
# end


# create cocktails
# recipes_raw = open(url_cocktail).read
# recipes = JSON.parse(cocktails_raw)

# recipes.each do |recipe|
#   Cocktail.create(name:recipe["name"])
#   recipe["ingredients"].each do |ingredient|
#     puts ingredient["ingredient"]
#     Ingredient.create(name: ingredient["ingredient"])
#     Dose.create(description:)
#   end

# end



#create doses by using cocktails names and ingredient names to find cocktail ids and ingredient ids

