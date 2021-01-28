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

    def self.suggest_random_recipe(recipe_ids_already_made)
        all_rec = Recipe.all
        new_recipes = []
        all_rec.each do |r|
            if !recipe_ids_already_made.any? {|e| e == r.id}
                new_recipes.push(r)
            end
        end
        new_recipes[rand(new_recipes.size - 1)]
    end

    def self.list_my_ingredients(recipe)
        recipe.ingredients.each {|i| puts i.name}
    end
end

