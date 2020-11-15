require "pry"
class Dog < ActiveRecord::Base 
    has_many :compatabilities
    has_many :users, through: :compatabilities 
 

    def self.hypo_dog(hypoaller)
        self.all.select do |pooch|
            pooch.hypoaller == hypoaller
        end
    end
    
    def self.all_dog
        all_dogs = []
        all_dogs << Dog.all
    end

    def call_bio(selected_dog)
        target_dog = Dog.all.find do |dog| 
            dog.name == selected_dog 
        end 
        target_dog.bio 
    end 


end 
   


      