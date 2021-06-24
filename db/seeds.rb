puts "Delete stores!"
Store.destroy_all

puts "Delete adoptions!"
Adoption.destroy_all

puts "Delete employees!"
Employee.destroy_all

puts "Delete pets!"
Pet.destroy_all

# puts "Delete sales!"
# Sale.destroy_all

# puts "Delete products!"
# Product.destroy_all

# puts "Delete customers!"
# Customer.destroy_all

# STORES

5.times do
    Store.create(name: Faker::Name.first_name + "'s Pet Store", address: (Faker::Address.street_address + ", " + Faker::Address.city + ", " + Faker::Address.state + " " + Faker::Address.zip))
end

# EMPLOYEES

puts "Creating employees..."

# make sure each store has at least 1 employee
num_stores = Store.all.count
index = 0

while (index < num_stores) do 
    Employee.create(name: Faker::FunnyName.name, years_experience: rand(1..5), full_time: rand(0..1), hours_scheduled: rand(0..40), age: rand(16..80), salary: rand(8000..40000), store_id: Store.all[index].id)
    index += 1
end 


20.times do 
    Employee.create(name: Faker::FunnyName.name, years_experience: rand(1..5), full_time: rand(0..1), hours_scheduled: rand(0..40), age: rand(16..80), salary: rand(8000..40000), store_id: Store.ids.sample)
end

puts "Done creating employees!"

# PETS

puts "Creating pets..."

SPECIES = ["Cat", "Dog", "Bird", "Lizard", "Frog"]

40.times do 
    Pet.create(nickname: Faker::FunnyName.name, species: SPECIES.sample, weight: rand(1.0..20.0).round(2), age: rand(1..20), alive: rand(0..1), years_in_captivity: rand(0..10), price: rand(1.5...100.0).round(2))
end

puts "Done creating pets!"

# ADOPTIONS

puts "Creating adoptions.."

40.times do 
    Adoption.create(employee_id: Employee.ids.sample, pet_id: Pet.ids.sample)
end 

puts "Done creating adoptions!"

# PRODUCTS

# puts "Creating products..."

# 20.times do
#     Product.create(store_id: Store.ids.sample, name: , price: rand(1.0..500.0))
# end

# puts "Done creating products!"

# # CUSTOMERS

# puts "Creating customers..."

# 7.times do
#     Customer.create(name: Faker::FunnyName.name)
# end

# puts "Done creating customers!"

# # SALES

# puts "Creating sales..."

# 15.times do
#     Sale.create(employee_id: Employee.ids.sample, product_id: Product.ids.sample, customer_id: Customer.ids.sample)
# end

# puts "Done creating sales!"