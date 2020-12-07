require_relative '../config/environment'

#ALL VENUE INSTANCES HAVE TO BE PRELOADED
#Assume Venues already exist in the database

puts `clear`
puts "BETA Build"
puts "\n\n\nHello, and welcome to the Artist Event Scheduler!\n\n\n\n"
print "Please enter your Artist/Band Name: "
artist_name = gets.chomp
artist = Artist.find_or_create_by(name: artist_name)
puts `clear`

input = "begin" 
while input != "exit" do
    print "\n\nPlease type 'menu' to see your list of available actions: "
    input = gets.chomp
    case input 
    when "MENU".downcase
        puts `clear`
        main_menu
    when "CITY LIST".downcase
        puts `clear`
        list_all_cities
    when "CREATE SHOW".downcase
        puts `clear`
        create_a_show(artist)
    when "UPCOMING OR PAST DATES".downcase
        puts `clear`
        show_all_my_show(artist)
    when "UPDATE EXISTING SHOW".downcase
        puts `clear`
        update_my_show(artist)
    when "DELETE EXISTING SHOW".downcase
        puts `clear`
        delete_my_show(artist)
    when "EXIT".downcase
        break
    else 
        puts `clear`
        puts "This is an UNKNOWN command, please try again!"
    end 
end 
