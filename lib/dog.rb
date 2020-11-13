require "pry"
class Dog < ActiveRecord::Base 
    has_many :compatabilities
    has_many :users, through: :compatabilities 
end 

def self.find_hypo_dog(hypoaller)
    self.all.select do |dogs|
        dogs.hypoaller == hypoaller
    end







end 
    # def hypo_dogs
    #     array_of_hypo_dogs = []
        
    #     hypo_k9 = Dog.all.select do |dog|
    #         dog.hypoaller == true 
    #         end 
        
    #         hypo_k9 << array_of_hypo_dogs
         
    # end 
    
    # def allergy
    #     if allergy_input == true 
    #         hypo_dogs 
    #     elsif Dog.all 
        
    #     end 
    # end 



      