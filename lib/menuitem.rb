class MenuItem < ActiveRecord::Base
    has_many :restaurant_menu_items
    has_many :restaurants, through: :restaurant_menu_items
end