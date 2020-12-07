def main_menu 
    puts "Please type in your selection\n\n"
    puts "1. City List"
    puts "2. Create Show"
    puts "3. Upcoming or Past Dates"
    puts "4. Update Existing Show"
    puts "5. Delete Existing Show"
    puts "6. Type 'Exit' to leave the Artist Event Scheduler"
end 

# Sign in or create account for Artist method
def create_account
    print "Whats your Artist/Band name?: "
    user_input = gets.chomp
    new_account = Artist.find_or_create_by(name: user_input)
    puts "Welcome, #{user_input}!"
    new_account
end

#HELPER METHOD for listing all available cities
def list_all_cities
    index = 0
    Venue.all.each{|venue| puts "#{index += 1}. #{venue.city}"}
end 

#HELPER METHOD for listing Venue names of their respective cities
def city_venue(city)
    all_venue_cities = Venue.all.select{|venue| venue.city == city}
    all_venue_cities.each{|venue| puts "-#{venue.name}"}
end 

#HELPER METHOD for showing artists existing dates
def dates_of_shows_helper_method(artist)
    ShowDate.all.select{|show_date| show_date.artist_id == artist.id}.map{|showdate| showdate.date}
end 

#HELPER METHOD for showing artists existing venues
def venues_of_shows_helper_method(artist) 
    ShowDate.all.select{|show_date| show_date.artist_id == artist.id}.map{|showdate| showdate.venue.name}
end 

#CREATE ShowDate method
def create_a_show(artist)
    puts "When is your show? (MM-DD-YYY): \n\n" #Could use any format, but for designer purposes.
    date = gets.chomp
    puts `clear`
    puts "What city is your show in?: \n\n"
    list_all_cities
    puts "\n"
    city = gets.chomp  
    puts `clear`
    puts "Choose a venue!: \n\n"
    city_venue(city)
    puts "\n"
    venue = gets.chomp
    puts `clear`
    selected_venue = Venue.find_by(name: venue)
    new_show_date = ShowDate.create()
    new_show_date.date = date
    new_show_date.artist_id = artist.id
    new_show_date.venue_id = selected_venue.id
    new_show_date.save
    puts "Congratulations! Your show date is #{date}, at #{venue} in #{city}!\n\n"
end

#READ ShowDate method
def show_all_my_show(artist)
   all_show_dates = dates_of_shows_helper_method(artist)
   all_venue_names = venues_of_shows_helper_method(artist)
    if all_show_dates == [] && all_venue_names == [] 
        puts "Oh no! Looks like you don't have any dates yet! Go back to the menu to create one!\n\n"
        else  puts "You have a show on #{all_show_dates.uniq.join(', ')} at #{all_venue_names.uniq.join(', ')}!\n\n"
    end 
end 

# UPDATE ShowDate method
def update_my_show(artist)
    puts "Here is a list of your shows! Please type in the date you would like to change: \n\n"
    puts "- #{dates_of_shows_helper_method(artist).join(", ")} at #{venues_of_shows_helper_method(artist).uniq.join(', ')}.\n\n"
    date_selected = gets.chomp
    puts `clear`
    puts "Choose a city for the updated show: \n\n"
    list_all_cities
    puts "\n"
    city_selected = gets.chomp
    puts `clear`
    puts "Choose the venue: \n\n"
    city_venue(city_selected)
    puts "\n"
    puts "Selected Venue: \n"
    venue_selected = gets.chomp
    puts "\n"
    puts `clear`
    print "Please enter your new desired date in the format 'MM-DD-YYYY': \n\n"
    new_date = gets.chomp
    puts `clear`
    change_date = ShowDate.all.find_by(artist_id: artist.id)
    change_city = Venue.all.find_by(city: city_selected)
    change_venue = Venue.all.find_by(name: venue_selected)
    set_date = change_date.update(date: new_date)
    set_city = change_city.update(city: city_selected)
    set_venue = change_venue.update(name: venue_selected)
    puts "Congratulations! Your Show for that date is now updated to #{new_date} in #{city_selected} at #{venue_selected}!\n\n"
end 

#DELETE ShowDate method
def delete_my_show(artist)
    puts "Here are your shows! Please type in the date you would like to cancel and delete: \n\n"
    puts "- #{dates_of_shows_helper_method(artist).uniq.join(", ")}\n\n"
    puts "Selected Date: "
    date_selected = gets.chomp
    delete_date = ShowDate.all.find_by(artist_id: artist.id)
    delete_date.destroy
    puts "\n"
    puts "Congratulations! Your selected show has been successfully cancelled!\n\n"
end 

#Tried to implement return option:
# def return_to_menu
#     input = "begin"
#     while input != "return" do 
#         print "Type 'return' to go back to menu: "
#         input = gets.chomp
#             case input
#         when "return"
#         break
#         end 
#     end 
# end 