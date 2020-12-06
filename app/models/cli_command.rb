
def main_menu 
    puts "Please type in your selection"
    puts "1. list venue cities"
    puts "2. create a show"
    puts "3. show my dates"
    puts "4. update a show date"
    puts "5. delete a show"
    puts "6. Type 'exit' to leave Artist Tracker"
end 

# Sign in or create account for Artist method
def create_account
    print "Type in your band name: "
    user_input = gets.chomp
    new_account = Artist.find_or_create_by(name: user_input)
    puts "Welcome #{user_input}"
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
    all_venue_cities.each{|venue| puts "#{venue.name}"}
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
    puts "When and where would you like to play? Please use format 'YYYY-MM-DD': "
    date = gets.chomp
    puts `clear`
    puts "What city would you like to play in?: "
    list_all_cities
    city = gets.chomp  
    puts `clear`
    puts "Which of these Venues would you like to play at?: "
    city_venue(city)
    venue = gets.chomp
    puts `clear`
    selected_venue = Venue.find_by(name: venue)
    new_show_date = ShowDate.create()
    new_show_date.date = date
    new_show_date.artist_id = artist.id
    new_show_date.venue_id = selected_venue.id
    new_show_date.save
    puts "Congratualtions! Your show date is #{date}, at #{venue} in #{city}."
end


#READ ShowDate method
def show_all_my_show(artist)
   all_show_dates = dates_of_shows_helper_method(artist)
   all_venue_names = venues_of_shows_helper_method(artist)
    if all_show_dates == [] && all_venue_names == [] 
        puts "Sorry, you currently do not have any dates listed for a venue. Please create a show."
        else  puts "You will be playing on the date #{all_show_dates.uniq.join(', ')} at #{all_venue_names.uniq.join(', ')}."
    end 
end 


# UPDATE ShowDate method
def update_my_show(artist)
    puts "Here is a list of your Venue dates. Please type in the date you would like to change: "
    puts "- #{dates_of_shows_helper_method(artist).join(", ")}"
    date_selected = gets.chomp
    puts `clear`
    print "Please enter your new desired date in the format 'YYYY-MM-DD': "
    new_date = gets.chomp
    puts `clear`
    change_date = ShowDate.all.find_by(artist_id: artist.id)
    set_date = change_date.update(date: new_date)
    puts "Congratulations, your Venue date is now updated to #{new_date}!"
end 


#DELETE ShowDate method
def delete_my_show(artist)
    puts "Here are your Venue dates. Please type in the date you would like to cancel and delete: "
    puts "- #{dates_of_shows_helper_method(artist).uniq.join(", ")}"
    date_selected = gets.chomp
    delete_date = ShowDate.all.find_by(artist_id: artist.id)
    delete_date.destroy 
    puts "Congratulations, your selected venue date has been successfully cancelled."
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


