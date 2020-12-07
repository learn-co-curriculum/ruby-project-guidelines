require_relative '../config/environment'

#ALL VENUE INSTANCES HAVE TO BE PRELOADED
#Assume Venues already exist in the database

puts `clear`
puts "BETA Build v1.0"
puts "\n\n\nHello, and welcome to the Artist Event Scheduler!\n\n\n\n"
print "Please enter your Artist/Band Name: "
artist_name = gets.chomp
artist = Artist.find_or_create_by(name: artist_name)
puts `clear`

input = "begin" 
while input != "exit" do
    print "\n\nPlease type '0' to see your list of available actions: "
    input = gets.chomp
    case input 
    when "0"
        puts `clear`
        main_menu
    when "1"
        puts `clear`
        list_all_cities
    when "2"
        puts `clear`
        create_a_show(artist)
    when "3"
        puts `clear`
        show_all_my_show(artist)
    when "4"
        puts `clear`
        update_my_show(artist)
    when "5"
        puts `clear`
        delete_my_show(artist)
    when "EXIT".downcase
        puts `clear`
        break
    else 
        puts `clear`
        puts "This is an UNKNOWN command, please try again!"
    end 
end 