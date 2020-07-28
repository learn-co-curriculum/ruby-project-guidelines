require_relative '../config/environment'

item1=Item.create(name: "Dell",cost: 800)
item2=Item.create(name: "HP",cost: 700)
item3=Item.create(name: "Samsung",cost: 700)
item4=Item.create(name: "Dell",cost: 900)
item5=Item.create(name: "Dell",cost: 1000)
item6=Item.create(name: "Dell",cost: 600)

user1=User.create(name: "Yehong")
user2=User.create(name: "Yordin")

purchase1 =Purchase.create(user_id:1, item_id:1)
purchase2 =Purchase.create(user_id:2, item_id:1)
purchase3 =Purchase.create(user_id:1, item_id:2)
purchase4 =Purchase.create(user_id:2, item_id:2)

review1=Review.create(star:3,user_id:1, item_id:1)
review2=Review.create(star:5,user_id:1, item_id:2)
review3=Review.create(star:4,user_id:2, item_id:3)
review4=Review.create(star:5,user_id:2, item_id:2)