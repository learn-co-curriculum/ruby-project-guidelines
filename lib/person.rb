class Person < ActiveRecord::Base 
    has_many :adoptions
    has_many :dogs, through: :adoptions

end 