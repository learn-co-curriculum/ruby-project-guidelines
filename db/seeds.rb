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

Order.create(customer_id: 180, food_id: 801, quantity:10)
Order.create(customer_id: 1, food_id: 802, quantity:8)

