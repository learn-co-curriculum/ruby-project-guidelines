class MenuItem < ActiveRecord::Base
    has_many :restaurants, through: :restaurant_menu_items
end