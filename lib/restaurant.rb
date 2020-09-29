class Restaurant < ActiveRecord::Base
    has_many :menu_items, through: :restaurant_food_items
end