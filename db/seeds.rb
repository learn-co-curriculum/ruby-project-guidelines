User.destroy_all 
Dog.destroy_all
Compatability.destroy_all

user1 = User.create(name: "Joe", allergy: "no")
user2 = User.create(name: "Isa", allergy: "no")
user3 = User.create(name: "Rick", allergy: "yes")
user4 = User.create(name: "Morty", allergy: "yes")

dog1 = Dog.create(name: "Blizzard", breed: "Husky", energy_level: "High", age: 3, hypoaller: "no", sex: "M", weight: 50,
bio: "Blizzard is very energetic and very intelligent. \n Capable of opening doors with his mouth! \n Enjoys going on daily runs and enjoys ear rubs." 
)

dog2 = Dog.create(name: "Cali", breed: "Golden Retriever", energy_level: "High", age: 2, hypoaller: "no", sex: "F", weight: 70,
bio: "Cali is the sweetest girl ever! Gentle and noble, she brightens any room she enters with her gentle demeanor. \n Cali enjoys walks in which she holds her leash in her mouth. \n Cali loves dogs and people alike!")

dog3 = Dog.create(name: "Star", breed: "Portuguese Water Dog", energy_level: "High", age: 5, hypoaller: "yes", sex: "F", weight: 60,
bio: "Star is a handful! She has a LOT of energy! \n Star enjoys fetching on land and in water! \n She has a quiet confidence and learns new tricks and commands lightning fast! \n She is very affectionate!")

dog4 = Dog.create(name: "Gretchen", breed: "Giant Schnauzer", energy_level: "Moderate", age: 6, hypoaller: "yes", sex: "F", weight: 100,
bio: "Gretchen is very intelligent! \n She’s extremely loyal! \n She has quiet confidence and a very powerful presence! \n She will defend who she loves ferociously! \n She is not aggressive, although many perceive her to be. \n She enjoys head rubs!")

dog5 = Dog.create(name: "Fluffy", breed: "Pomi", energy_level: "High", age: 2, hypoaller: "no", sex: "F", weight: 5,
bio: "A bundle of energy that loves being around people! \n Fluffy spins in circles when she is excited! \n Fluffy is not one to get pushed around by anyone regardless of their size") 

dog6 = Dog.create(name: "Alpha", breed: "Doberman", energy_level: "High", age: 4, hypoaller: "no", sex: "M", 
    weight: 90, bio: "Alpha is an all-round excellent dog. \n Looks very intimidating, but once you’re in the pack, he is the most loyal and lovable friend you can have. \n Extremely sharp and clever, Alpha requires lot of mental stimulation.")

dog7 = Dog.create(name: "Borat", breed: "French Bulldog", energy_level: "Moderate", age: 6, hypoaller: "no", sex: "M", weight: 25, 
bio: "Borat is quite the character! \n When he looks at you, you know that there is a very intelligent being who analyzes and observes before acting. \n Borat loves his ears being rubbed. \n Fearless despite being very small, sometimes gets him in trouble. \n Great dog though!")

dog8 = Dog.create(name: "Luna", breed: "Maltese", energy_level: "Moderate", age: 3, hypoaller: "yes", sex: "F", weight: 7, 
bio: "Luna is a lover! She enjoys sitting on laps with people! \n Luna’s long coat requires daily brushing to maintain its elegance. \n Luna is social with all dogs, but a little shy around bigger dogs. \n Luna enjoys short walks. \n Her little, stumpy legs get tired quickly")

dog9 = Dog.create(name: "Hulk", breed: "Bichon", energy_level: "Moderate", age: 5, hypoaller: "yes", sex: "M", weight: 10, 
bio: "Hulk is a yappy one! \n He gets his name from his loud barking! \n Despite his little stature, he is very strong and will knock over other little dogs. \n When he isn’t wrestling around, he enjoys naps snuggled with his human!")

    dog10 = Dog.create(name: "Snickers", breed: "Toy Poodle", energy_level: "Moderate", age: 4, hypoaller: "yes", sex: "F", weight: 8, 
        bio: "Very intelligent dog. Observes a lot. \n Doesn’t do well with young children, but is fantastic with adults. \n Enjoys naps on the couch. \n Enjoys short walks or going in a doggy stroller.")

dog11 = Dog.create(name: "Frankie", breed: "English Bulldog", energy_level: "Couch Potato", age: 6, hypoaller: "no", sex: "M", weight: 50, 
bio: "Quite the little tank! \n Being a bully breed, he lives up to that reputation! \n When excited is prone to knocking everything over that get in his way. \n Enjoys being outside, but not too long in the summertime because he will get overheated. \n Very independent and happy dog. \n Not the best with small children, doesn’t know his strength.")

dog12 = Dog.create(name: "Molly", breed: "Shih Tzu", energy_level: "Couch Potato", age: 7, hypoaller: "yes", sex: "F", weight: 12, 
    bio: "Molly is great with kids! \n She loves to be around children and to play. \n Boundless energy! \n When she is tired she will snuggle up and sleep on your chest! \n Keep her hair short to keep her clean and tangle free, doesn’t like to be brushed!")

match1 = Compatability.create(user_id: user1.id, dog_id: dog1.id) 




