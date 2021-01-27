require_relative '../config/environment'
require_relative 'api_parsing'


 
puts "Welcome to the Cocktail Recipe Interface"
puts "Please enter your username"
user_name = gets.chomp #call find_or_create_by_name method in user.rb
current_user = User.find_or_create_by_name(user_name)

puts "Hello, #{user_name},"
puts "What would you like to do?"
puts "1. Find a random recipe by ingredient" 
    #call suggest_random_recipe using find_recipe_by_ingredient method and then 
    #picking a random array element in recipe.rb 
    #be sure to prompt_user_for_rating
puts "2. Show my favorite recipes"
    #traverse through user_recipe table to find highest ratings and return as an array
puts "3. Suggest a new recipe"
    #traverse through recipes and spit out random one
    #be sure to prompt_user_for_rating
puts "4. Look up a recipe by recipe name"

    #call find_recipe_by_name
puts "5. List all recipes with a certain ingredient"
    #call find_recipe_by_ingredient method and return an array of choices
puts "6. Import a recipe from the database"
choice = gets.chomp
choice = choice.to_i
if choice == 2
    current_user.show_highest_ratings

elsif choice == 3
    #Right now it just picks a random recipe even if the user has made it before
    #Maybe change to only reccomend new recipes?
    current_recipe = Recipe.suggest_random_recipe
    puts "Time to make a(n) #{current_recipe.name}!"
    puts "Here are the ingredients:"
    Recipe.list_my_ingredients(current_recipe)
    puts current_recipe.instructions
    current_user.rate_recipe(current_recipe)
    binding.pry

elsif choice == 6
    puts "Enter the recipe name you are looking for"
    name = gets.chomp
    get_data(name)
    puts "The recipe for #{name} has been sucessfully imported."
end


#make method prompt_user_for_rating which will ask for a rating 
#then store it with the recipe in the user_recipe table
#make method update_rating ?
