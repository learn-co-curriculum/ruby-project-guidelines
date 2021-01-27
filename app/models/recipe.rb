class Recipe < ActiveRecord::Base
    has_many :ingredients, through: :ingredient_recipes
    has_many :users, through: :user_recipes

    def self.find_or_create_recipe(name, instructions)
        if Recipe.all.find{|r| r.name == name}
        else
            Recipe.create(name: name, instructions: instructions)
        end
        Recipe.all.find{|r| r.name == name}  
    end
end

