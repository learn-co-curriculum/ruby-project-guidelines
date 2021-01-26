class CreateUserRecipes < ActiveRecord::Migration[5.1]
    def change
        create_table :user_recipes do |t|
            t.integer :user_id
            t.integer :recipe_id
            t.integer :rating
        end
    end
end