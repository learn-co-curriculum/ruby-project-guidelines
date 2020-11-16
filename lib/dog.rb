require "pry"
class Dog < ActiveRecord::Base 
    has_many :compatabilities
    has_many :users, through: :compatabilities 
 

    def self.hypo_dog(hypoaller)
        self.all.select do |pooch|
            pooch.hypoaller == hypoaller
        end
    end



end 
   


      