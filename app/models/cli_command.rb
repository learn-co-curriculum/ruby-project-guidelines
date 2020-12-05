def main_menu 
    puts "Please enter your artist name"
    puts "1. list Venue cities"
    puts "2. create a show"
    #puts "3. update a show"
    #puts "4. delete a show"
    puts "type 'exit' to leave Artist Tracker"
end 


def list_all_cities
    index = 0
    Venue.all.each{|venue| puts "#{index += 1}. #{venue.city}"}
end 

def create_account
    print "Type in your band name: "
    user_input = gets.chomp
    new_account = Artist.find_or_create_by(name: user_input)
    puts "Welcome #{user_input}"
    new_account
end 

def city_venue(city)
    all_venue_cities = Venue.all.select{|venue| venue.city == city}
    all_venue_cities.each{|venue| puts "#{venue.name}"}
end 

#CREATE 
def create_a_show(artist)
    print "When and where would you like to play? Please use format 'YYYY-MM-DD': "
    date = gets.chomp
    print "What city would you like to play in?: "
    list_all_cities
    city = gets.chomp 
    city_venue(city) 
    print "Which of these Venues would you like to play at?: "
    venue = gets.chomp
    selected_venue = Venue.find_by(name: venue)
    new_show_date = ShowDate.create()
    new_show_date.date = date
    new_show_date.artist_id = artist.id
    new_show_date.venue_id = selected_venue.id
    new_show_date.save
    puts "Congratualtions! Your show date is #{date}, at #{venue} in #{city}."
end


#READ
def show_all_my_show(artist)
   all_show_dates = ShowDate.all.select{|show_date| show_date.artist_id == artist.id}.map{|showdate| showdate.date}
   puts all_show_dates
end 

def ask_for_new_input
    puts "That was not a valid input, please try again"
end 

#FOR UPDATE METHOD, ONLY LET THEM UPDATE THE DATE OF THEIR SHOW
#1. Have find all of their personal dates for their shows
#2. Then you ask them which one to update by date using 'print and chomp'
#3. Find that instance by date they gave and store that instance as a variable 
#4. call .update on that variable(instance) to change their date to whatever they gave.

#FOR DELETE METHOD, ONLY LET THEM DELETE THE DATE OF THEIR SHOW
#1. Have find all of their personal dates for their shows
#2. Then you ask them which one to delete by date using 'print and chomp'
#3. Find that instance by date they gave and store that instance as a variable 
#4. call .destroy on that variable(instance) to change their date to whatever they gave.