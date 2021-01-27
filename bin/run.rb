require_relative '../config/environment'


 
puts "Welcome to the Cocktail Recipe Interface"
puts "Please enter your username"
user_name = gets.chomp #call find_or_create_by_name method in user.rb
current_user = User.find_or_create_by_name(user_name)
    binding.pry
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
choice = gets.chomp
    #if choice == 1 do blah blah blah etc.

#make method prompt_user_for_rating which will ask for a rating 
#then store it with the recipe in the user_recipe table
#make method update_rating ?
