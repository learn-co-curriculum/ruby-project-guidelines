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
        name: Faker::Name.name,
        password: Faker::Barcode.ean 
    )
end


Customer.create(name:'Dan', password:'123')
Customer.create(name:'Tee', password:'321')
Customer.create(name:'Bob', password:'111')

Food.create(name: 'Methi', category: 'Spice', price: 10)
Food.create(name: 'Rosemary', category: 'Spice', price: 10)
Food.create(name: 'Parsnip', category: 'Vegetables', price: 10)


Order.create(customer_id: Customer.all.sample.id, food_id: Food.all.sample.id, quantity: 2, total: 20)
Order.create(customer_id: Customer.all.sample.id, food_id: Food.all.sample.id, quantity: 2, total: 20)
Order.create(customer_id: Customer.all.sample.id, food_id: Food.all.sample.id, quantity: 2, total: 20)




puts "Food"

# 30.times do 
#     Food.create(
#         name: Faker::Food.fruits,
#         price: rand(20..180),
#         category: "Fruits" 
#     )
# end

# 30.times do 
#     Food.create(
#         name: Faker::Food.vegetables,
#         price: rand(20..180),
#         category: "Vegetables" 
#     )
# end

# 30.times do 
#     Food.create(
#         name: Faker::Food.spice,
#         price: rand(20..180),
#         category: "Spice" 
#     )
# end




#Faker::Food.vegetables
#Faker::Food.spice
#Faker::Food.fruits

# 60.times do 
#     Order.create(
#         customer_id: Customer.all.sample.id,
#         food_id: Food.all.sample.id,
#         quantity: rand(1..20),
#         #total: Food.all.map{|foo| foo.price if foo.id == self.food_id} * self.quantity
#     )
# end

# #Custome(name: "Dan")
# #Food.create(name: "Apple", price: 1 )
# Order.create(customer_id: 180, food_id: 831, quantity:10)
# #total: Food.all.map{|foo| foo.price if foo.id == self.food_id} * self.quantity








# c1 = Customer.create(name:'Dan')

# f1 = Food.create(name:'pie',price: 2)


