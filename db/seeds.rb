require_relative "../config/environment.rb"
require_relative "../app/models/customer.rb"
require_relative "../app/models/food.rb"
require_relative "../app/models/order.rb"



Order.destroy_all
Customer.destroy_all
Food.destroy_all


puts "Customer"

20.times do 
    Customer.create(
        name: Faker::Name.name
    )
end

puts "Food"

100.times do 
    Food.create(
        name: Faker::Food.ingredient,
        price: rand(20..180)
    )

end


#Faker::Food.vegetables
#Faker::Food.spice
#Faker::Food.fruits

60.times do 
    Order.create(
        customer_id: Customer.all.sample.id,
        food_id: Food.all.sample.id,
        quantity: rand(1..20),
        #total: Food.all.map{|foo| foo.price if foo.id == self.food_id} * self.quantity
    )
end

#Custome(name: "Dan")
#Food.new(name: "Apple", price: 1 )
Order.create(customer_id: 180, food_id: 831, quantity:10)
#total: Food.all.map{|foo| foo.price if foo.id == self.food_id} * self.quantity








# c1 = Customer.create(name:'Dan')

# f1 = Food.create(name:'pie',price: 2)


