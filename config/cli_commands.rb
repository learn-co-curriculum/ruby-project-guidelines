def main_menu 
    puts "What would you like to do?"
    puts "1. list cities"
    puts "2. create account"
    puts "3. create a show"
    puts "4. delete my show"
    puts "5. exit"
    user_input = gets.chomp
end 


def list_all_cities
    all_cities = Venue.get_cities
    all_cities.each_with_index{|city, index| puts "#{index + 1}. #{city}"}
end 

def create_account
    puts "Type in your band name"
    user_input = gets.chomp
    new_account = Artist.find_or_create_by(name: user_input)
    puts "Welcome #{user_input}"
end 

def ask_for_new_input
    puts "That was not a valid input, please try again"
end 