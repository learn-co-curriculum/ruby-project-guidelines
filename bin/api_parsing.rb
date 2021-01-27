require_relative '../config/environment'
require 'rest-client'
require 'json'
require 'pry'

def enter_name
    puts "Enter drink name"
    name = gets.chomp
end

def get_data(name)
    # binding.pry

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
    binding.pry
    drink_name = result["drinks"][0]["strDrink"]
    drink_instructions = result["drinks"][0]["strInstructions"]
    Recipe.import_recipe(name: drink_name, instructions: drink_instructions)
    
end

