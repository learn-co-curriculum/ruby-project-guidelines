require_relative "../app/models/customer.rb"
require_relative "../app/models/food.rb"
require_relative "../app/models/order.rb"
require_relative "../config/environment.rb"



Customer.destroy_all
Food.destroy_all
Order.destroy_all


puts "Customer"

10.times do 
    Customer.create(
        name
    )