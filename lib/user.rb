class User < ActiveRecord::Base
    has_many :restaurant_menu_items
    has_many :restaurants, through: :restaurant_menu_items
    has_many :menu_items, through: :restaurant_menu_items
end