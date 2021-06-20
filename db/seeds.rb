puts "Delete stores!"
Store.destroy_all

puts "Delete employees!"
Employee.destroy_all

puts "Delete pets!"
Pet.destroy_all

# EMPLOYEES

puts "Creating employees..."

4.times do 
    Employee.create(name: Faker::FunnyName.name, )
end