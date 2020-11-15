class User < ActiveRecord::Base 
    has_many :compatabilities
    has_many :dogs, through: :compatabilities 

     
 

    
end













