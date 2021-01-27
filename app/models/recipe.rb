class Recipe < ActiveRecord::Base
    has_many :ingredients, through: :ingredient_recipes
    has_many :users, through: :user_recipes

    def self.import_recipe(:name, :instructions)
        Recipe.create(:name, :instructions)
        IngredientRecipe.create(recipe_id: self.id)
    end
end

