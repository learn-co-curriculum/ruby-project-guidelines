class Ingredient < ActiveRecord::Base
    has_many :recipes

    def self.add__or_create_ingredient(ingredient)
        if Ingredient.all.find{|i| i.name == ingredient}
        else
            Ingredient.create(name: ingredient)
        end
        Ingredient.all.find{|i| i.name == ingredient} 
    end

end
