#require_relative '../config/cli_commands'
require_relative '../config/environment'

#ALL VENUE INSTANCES HAVE TO BE PRELOADED AND THEY ARE STATIC

puts `clear` 
puts "Welcome to our Artist App Tracker!"
print "please enter username: "
artist_name = gets.chomp
artist = Artist.find_or_create_by(name: artist_name)

input = "begin" 
while input != "exit" do
    print "What would you like to do(type 'menu' for menu: "
    input = gets.chomp
    case input 
    when "menu" 
        main_menu
    when "list Venue cities"
        list_all_cities
    when "create a show"
        create_a_show(artist)
    #when "update a show"
        #call some update method
    #when "delete a show"
        #call some delete method
    when "exit"
        break
    else 
       puts "This is an unknown command, please try again."
    end 
end 
