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
end