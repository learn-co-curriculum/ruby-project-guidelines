class IngredientRecipe < ActiveRecord::Base
    belongs_to :ingredient
    belongs_to :recipe

    def self.find_or_create_ingredient_recipe(recipe_id, ingredient_id)
        if IngredientRecipe.all.find {|ir| ir.recipe_id == recipe_id && ir.ingredient_id == ingredient_id}
        else
            IngredientRecipe.create(recipe_id: recipe_id, ingredient_id: ingredient_id)
        end
        IngredientRecipe.all.find {|ir| ir.recipe_id == recipe_id && ir.ingredient_id == ingredient_id}
    end

    def self.find_recipe_by_ingredient(ingredient)

        while !Ingredient.all.find {|i| i.name == ingredient}
            puts "Ingredient not found. Please enter a valid ingredient"
            ingredient = gets.chomp
        end
            
        ingredient_id = Ingredient.all.find {|i| i.name == ingredient}.id
        
        ing_rec_instance = IngredientRecipe.all.select {|ir| ir.ingredient_id == ingredient_id}
        rec_ids = ing_rec_instance.map{|i| i.recipe_id}
        recs = Recipe.all.select {|r| rec_ids.any?(r.id)}
        puts "The recipes containing #{ingredient} are:"
        recs.each do |r|
            puts r.name
        end
    end

    def self.random_recipe_from_ingredient(ingredient)
        recipe_array = UserRecipe.find_recipe_by_ingredient(ingredient)
        
end