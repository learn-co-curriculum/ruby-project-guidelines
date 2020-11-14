require "pry"
class Dog < ActiveRecord::Base 
    has_many :compatabilities
    has_many :users, through: :compatabilities 
 

    def self.find_hypo_dog(hypoaller)
         #hypo_dog_array = []

    #     #hypo_aller_dog = 
         self.all.select do |dog|
             dog.hypoaller == hypoaller
         end
        
     end 

end 
   


      