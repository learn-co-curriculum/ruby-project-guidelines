steak_burrito = MenuItem.create(name: "Steak Burrito")
chicken_burrito = MenuItem.create(name: "Chicken Burrito")
veggie_burrito = MenuItem.create(name: "Veggie Burrito")


steak_tacos = MenuItem.create(name: "Steak Tacos")
chicken_tacos = MenuItem.create(name: "Chicken Tacos")
veggie_tacos = MenuItem.create(name: "Veggie Tacos")


cheese_pizza = MenuItem.create(name: "Cheese Pizza")
sausage_pizza = MenuItem.create(name: "Sausage Pizza")
pepperoni_pizza = MenuItem.create(name: "Pepperoni Pizza")
veggie_pizza = MenuItem.create(name: "Veggie Pizza")

hamburger = MenuItem.create(name: "Hamburger")
cheeseburger = MenuItem.create(name: "Cheeseburger")
polish_sausage = MenuItem.create(name: "Polish Sausage")
italian_sausage = MenuItem.create(name: "Italian Sausage")
italian_beef = MenuItem.create(name: "Italian Beef")
fries = MenuItem.create(name: "Fries")
onion_rings = MenuItem.create(name: "Onion Rings")
grilled_chicken = MenuItem.create(name: "Grilled Chicken")
salad = MenuItem.create(name: "Salad")

ice_cream = MenuItem.create(name: "Ice Cream")
cake = MenuItem.create(name: "Cake")
milkshake = MenuItem.create(name: "Milkshake")
cookie = MenuItem.create(name: "Cookie")
brownie = MenuItem.create(name: "Brownie")



names = ["Superdawg Drive-In", "Band of Bohemia", "Smoque BBQ", "Parachute", "Honey Butter Fried Chicken", "Cellar Door Provisions", "Fat Rice", "Mi Tocaya Antojería", "Lula Café", "Galit", "Pequod's Pizza"]

names.each do |name|
    Restaurant.create(name: name)
end

100.times do
    RestaurantMenuItem.create(menu_item_id: MenuItem.all.sample.id, restaurant_id: Restaurant.all.sample.id)
end
