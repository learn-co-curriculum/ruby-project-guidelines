class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :food
end 
