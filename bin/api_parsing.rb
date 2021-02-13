require_relative '../config/environment'
require 'rest-client'
require 'json'
require 'pry'


def get_data(name)


    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
    response = RestClient.get(url)
    result = JSON.parse(response)
    while result["drinks"] == nil
        puts "Drink not found. Please input another recipe name."
        name = gets.chomp
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
        response = RestClient.get(url)
        result = JSON.parse(response)
    end
     
    drink_name = result["drinks"][0]["strDrink"]
    drink_instructions = result["drinks"][0]["strInstructions"]
    current_ingr_num = 1
    current_recipe = Recipe.find_or_create_recipe(drink_name, drink_instructions)

    while result["drinks"][0]["strIngredient#{current_ingr_num}"]
        current_ingredient = Ingredient.add__or_create_ingredient(result["drinks"][0]["strIngredient#{current_ingr_num}"])
        IngredientRecipe.find_or_create_ingredient_recipe(current_recipe.id, current_ingredient.id)
        current_ingr_num += 1
    end

    drink_name

    
end

