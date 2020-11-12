class User < ActiveRecord::Base 
    has_many :compatabilities
    has_many :dogs, through: :compatabilities 

end 

#class Person 
# attr_accessor :name, :life_style, :allergy, :location
# @@all = []

# def initialize(name, life_style, allergy, location)
#     @name = name 
#     @life_style = life_style
            #5 high
            #4 moderate level of activity # .select |dog|
                #dog.energy >= 4 
            
            
            #3 normal 
            #2 minimal
            #1 couch potato 
#     @allergy = allergy 
            #if allergic == true 
            # gets recommeneded to hypoallergenic dogs 

            # not allergic == falsse
            # all dogs are avaialble/compatable 


#     @location = location 
            #if house all dogs available 
            # if apartment dogs weight < 30lbs/ low to couch potato energy dogs. 


#     @@all << self 

# end

# def compatability(life_style, allergy, location)
        
    
    

#     ##def life_style
#         ##if user_life_style choices are ;
#         [#active 
#         #moderate 
#         #semi-active
#         #not too active 
#         #couch potato  
#         ] 
#     ### allergy 
#             #if allergic => true 
#                 #if true, SELECT dogs that coats(fur type) == hypoallagneic 

#             #if not allergic => false 
#                 #if false all dogs available 



#     ### location 

#                 #apartment vs house 
#                 #if apartment, suggest dogs that are small OR dogs that are low/lower energy/temperament from Dog class
#                 #if house, suggest larger dogs/more energetic dogs. 
                














#if compatable adopt!
#puts "congratulations on your new furry partner!"
## if not, continue search!  
#puts "Let's try again, there is great compainion waiting fur you!"









