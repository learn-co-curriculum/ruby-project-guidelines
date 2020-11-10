class Dog < ActiveRecord::Base 
    has_many :adoptions 
    has_many :person, through: :adoptions 
end 