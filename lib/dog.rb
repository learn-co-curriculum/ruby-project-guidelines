require "pry"
class Dog < ActiveRecord::Base 
    has_many :compatability 
    has_many :user, through: :compatability 
end 


#### Attributes of Dog instances 
        ## weight 
        ## breed
        ## energy level
        ##age
        ##hypoallergenic == true this will be shoveled into an array of dogs that are COMPATABLE with user that have allergies.
        ## if non-hypoallergenic == false. All dogs are COMPATaBLE 

       
        # ##def non_allergic(dog)
        #     non_allergy = []
        #     hypo_a = Dog.all.select do |dog|
        #         dog.hypoallergenic == true 
           
        #     hypo_a << non_allergy
            
        #     end 
        #     else 
            
        #     #end 
