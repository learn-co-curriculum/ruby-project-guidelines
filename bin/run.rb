require_relative '../config/environment'

puts "HELLO WORLD"

<<<<<<< HEAD
item1 = Item.create(name: "Skytech Mage H",cost: 800)
item2 = Item.create(name: "HP",cost: 700)
item3 = Item.create(name: "Samsung",cost: 700)

user1 = User.create(name: "Yehong")
user2 = User.create(name: "Yordin")

purchase1 = Purchase.create(user_id:1, item_id:1)
purchase2 = Purchase.create(user_id:2, item_id:1)
purchase3 = Purchase.create(user_id:1, item_id:2)
purchase4 = Purchase.create(user_id:2, item_id:2)

review1 = Review.create(star:3,user_id:1, item_id:1)
review2 = Review.create(star:5,user_id:1, item_id:2)
review3 = Review.create(star:4,user_id:2, item_id:3)
review4 = Review.create(star:5,user_id:2, item_id:2)

    
=======


Item.search_by_name('Dell')   
User.total("Yehong")
>>>>>>> e9dee10579aed8ce164072618a6a891b4a7eefd5
