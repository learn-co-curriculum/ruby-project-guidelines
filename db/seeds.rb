User.destroy_all 
Dog.destroy_all
Compatability.destroy_all

user1 = User.create(name: "Joe", allergy: "no", location: "House", life_style: "Moderate")
user2 = User.create(name: "Isa", allergy: "no", location: "House", life_style: "Couch Potato")
user3 = User.create(name: "Rick", allergy: "yes", location: "Apartment", life_style: "Active")
user4 = User.create(name: "Morty", allergy: "yes", location: "Apartment", life_style: "Active")

dog1 = Dog.create(name: "Blizzard", breed: "Husky", energy_level: "High", age: 3, hypoaller: "no", sex: "M", weight: 50)
dog2 = Dog.create(name: "Cali", breed: "Golden Retriever", energy_level: "High", age: 2, hypoaller: "no", sex: "F", weight: 70)
dog3 = Dog.create(name: "Star", breed: "Portuguese Water Dog", energy_level: "High", age: 5, hypoaller: "yes", sex: "F", weight: 60)
dog4 = Dog.create(name: "Gretchen", breed: "Giant Schnauzer", energy_level: "Moderate", age: 6, hypoaller: "yes", sex: "F", weight: 100)
dog5 = Dog.create(name: "Fluffy", breed: "Pomi", energy_level: "High", age: 2, hypoaller: "no", sex: "F", weight: 5)
dog6 = Dog.create(name: "Alpha", breed: "Doberman", energy_level: "High", age: 4, hypoaller: "no", sex: "F", weight: 90)
dog7 = Dog.create(name: "Borat", breed: "French Bulldog", energy_level: "Moderate", age: 6, hypoaller: "no", sex: "M", weight: 25)
dog8 = Dog.create(name: "Luna", breed: "Maltese", energy_level: "Moderate", age: 3, hypoaller: "yes", sex: "F", weight: 7)
dog9 = Dog.create(name: "Hulk", breed: "Bichon", energy_level: "Moderate", age: 5, hypoaller: "yes", sex: "M", weight: 10)
dog10 = Dog.create(name: "Snickers", breed: "Toy Poodle", energy_level: "Moderate", age: 4, hypoaller: "yes", sex: "F", weight: 8)
dog11 = Dog.create(name: "Frankie", breed: "English Bulldog", energy_level: "Couch Potato", age: 6, hypoaller: "no", sex: "M", weight: 50)
dog12 = Dog.create(name: "Molly", breed: "Shih Tzu", energy_level: "Couch Potato", age: 7, hypoaller: "yes", sex: "F", weight: 12)

match1 = Compatability.create(user_id: user1.id, dog_id: dog1.id) 
###match1 = Compatability.create(user1, dog1)
                ###def check_compatability(user1)
                        #hypo_dogs = #Dog.all.select do |dog|
                            #dog.hypoaller == true
                        #end 





