require 'pry'

class User < ActiveRecord::Base
    has_many :user_recipes
    has_many :ingredients, through: :recipes
    has_many :recipes, through: :user_recipes

    def self.find_or_create_by_name(name)
        if User.all.find {|user| user.name == name} 
        else
            User.create name: name 
        end 
        User.all.find {|user| user.name == name} 
    end 

    def rate_recipe(recipe)
        puts "Would you like to rate this recipe? (y/n)"
        input = gets.chomp
        if input == "y"
        puts "How would you rate this recipe? (1-5)"
        rating = gets.chomp
        rating = rating.to_i
        while rating < 1 || rating > 5
            puts "Rating needs to be from 1-5, please try again."
            puts "How would you rate this recipe? (1-5)"
            rating = gets.chomp
            rating = rating.to_i
        end
        if UserRecipe.all.find{|i| i.user_id == self.id && i.recipe_id == recipe.id}
            puts "You have already rated this recipe!"
        else
            UserRecipe.create(user_id: self.id, recipe_id: recipe.id, rating: rating)
        end
        UserRecipe.all.select{|i| i.user_id == self.id && i.recipe_id == recipe.id} 
            else
        puts "Ok, maybe next time. "
        end 
    end

    def show_highest_ratings
        current_users_ratings = UserRecipe.all.select {|i| i.user_id == self.id}
        ratings_over_4 = current_users_ratings.select {|i| i.rating >= 4}

        if ratings_over_4
            ratings_over_4.each do |i| 
                drink = Recipe.all.find {|recipe| recipe.id == i.recipe_id}
                puts "#{drink.name}: #{i.rating} stars"
            end
        else
            puts "You don't have any favorite recipes!"
        end
    end

    def list_my_recipe_ids
        user_rec_array = UserRecipe.all.select {|i| i.user_id == self.id}
        user_rec_array.map{|r| r.recipe_id}
    end


    def find_recipe_by_name(name)
        rec_name = Recipe.all.find{|r| r.name == name}
        
        if !rec_name
            name = get_data(name)
            rec_name = Recipe.all.find{|r| r.name == name}
        end  
    #    while !rec_name 
    #     puts "Recipe not found. Please try another."
    #     input_value = gets.chomp
    #     rec_name = Recipe.all.find{|r| r.name == input_value}
    #     if  !rec_name
    #         get_data(input_value)
    #     end     
    #     end 
        puts "Here is your #{name} recipe."
        puts rec_name.instructions
        self.rate_recipe(rec_name)
    end 

end