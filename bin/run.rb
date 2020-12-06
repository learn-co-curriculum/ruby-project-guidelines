require_relative '../config/environment'

#ALL VENUE INSTANCES HAVE TO BE PRELOADED
#Assume Venues already exist in the database

puts `clear` 
puts "Welcome to our Artist App Tracker!"
print "please enter username: "
artist_name = gets.chomp
artist = Artist.find_or_create_by(name: artist_name)
puts `clear`


input = "begin" 
while input != "exit" do
    print "Please type 'menu' for menu: "
    input = gets.chomp
    case input 
    when "menu" 
        puts `clear`
        main_menu
    when "list venue cities"
        puts `clear`
        list_all_cities
    when "create a show"
        puts `clear`
        create_a_show(artist)
    when "show my dates"
        puts `clear`
        show_all_my_show(artist)
    when "update a show date"
        puts `clear`
        update_my_show(artist)
    when "delete a show"
        puts `clear`
        delete_my_show(artist)
    when "exit"
        break
    else 
        puts `clear`
        puts "This is an unknown command, please try again."
    end 
end 
