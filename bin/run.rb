
require_relative '../config/environment'

def shelter_name 
    font = TTY::Font.new("doom")
    pastel = Pastel.new
    puts pastel.red(font.write "Second") 
    puts pastel.green(font.write "Chance") 
    puts pastel.blue(font.write "Shelter") 
    sleep(4,)
end 

shelter_name 


#intro of the app 
puts "Hello and Welcome to Second Chance Shelter!"
puts "Please enter your name:"
name = gets.chomp
system "clear"
puts "#{name}, we will be asking you some question in hopes to better match you with your new forever furry friend!"



puts "Do you have any allergies? True or False"
allergy_input = gets.chomp.downcase 

# non_allergic_dog = Dog.hypo_dogs(dog)
# remaining_dog = 







#puts "HELLO WORLD"
