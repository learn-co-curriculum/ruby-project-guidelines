class IngredientRecipe < ActiveRecord::Base
    belongs_to :ingredient
    belongs_to :recipe

    def find_recipe_by_ingredient
        IngredientRecipe
    end 

end