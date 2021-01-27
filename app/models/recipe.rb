class Recipe < ActiveRecord::Base
    has_many :ingredients, through: :ingredient_recipes
    has_many :users, through: :user_recipes
end

