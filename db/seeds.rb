puts "Delete stores!"
Store.destroy_all

puts "Delete adoptions!"
Adoption.destroy_all

puts "Delete employees!"
Employee.destroy_all

puts "Delete pets!"
Pet.destroy_all

# STORES

5.times do
    Store.create(name: Faker::Name.first_name + "'s Pet Store", address: (Faker::Address.street_name + ", " + Faker::Address.city + ", " + Faker::Address.state + " " + Faker::Address.zip))
end

# EMPLOYEES

puts "Creating employees..."

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