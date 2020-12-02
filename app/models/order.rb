class Order < ActiveRecord::Base
    has_many :foods
    has_many :customers, through: :foods  
end 
