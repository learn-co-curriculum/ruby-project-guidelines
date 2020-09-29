class RestaurantMenuItem < ActiveRecord::Base
    belongs_to :menu_item
    belongs_to :restaurant
    belongs_to :user
end