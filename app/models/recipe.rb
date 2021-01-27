class Recipe < ActiveRecord::Base
    has_many :ingredient_recipes
    has_many :ingredients, through: :ingredient_recipes
    has_many :users, through: :user_recipes

    def self.find_or_create_recipe(name, instructions)
        if Recipe.all.find{|r| r.name == name}
        else
            Recipe.create(name: name, instructions: instructions)
        end
        Recipe.all.find{|r| r.name == name}  
    end

    def self.suggest_random_recipe
        # binding.pry
        Recipe.all[rand(Recipe.all.size)]
    end
    def self.list_my_ingredients(recipe)
        recipe.ingredients.each {|i| puts i.name}
    end
end

