require_relative '../config/environment'
class Menu 
    attr_accessor :user

    def initialize 
        @user = user
    end

    def start_program
        puts
        puts "Welcome to Event Tracker! This app will allow you to track your favorite events and see their current status."
        self.user = get_user
        pull_data_by_city_and_state(self.user.city, self.user.state)
        puts
        puts "Thank you, #{user.name}. Please select from the options below:"
        begin_search
    end

    def get_user_name
        puts "Please enter your full name"
        STDIN.gets.chomp
    end

    def get_user_city
        puts "Please enter your City"
        input = STDIN.gets.chomp.split.map(&:capitalize).join(' ')
        input == "" ? get_user_city : input
    end

    def get_user_state
        puts "Please enter your State (ex. WA, CA, NY)"
        input = STDIN.gets.chomp.upcase
        input == "" ? get_user_state : input
    end

    def pull_data_by_city_and_state(city, state)
        info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&stateCode=#{state}&size=100&sort=date,asc&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
        info["page"]["totalElements"] == 0 ? error_message : load_event_details(info)
    end
  
    def get_user
        puts "Enter 1 to Log in, or 2 to Create a new account, or x to exit the application"
        input = STDIN.gets.chomp
        if input == "1" 
            user = find_user_by(user_name = get_user_name)
            if !user
                puts "Account information not found. Would you like to make an account? Y / N "
                STDIN.gets.chomp.downcase == "y" ? user = create_user_by(user_name, get_user_city, get_user_state) : back_to_start
            end
        elsif input == "2"
            user = create_user_by(get_user_name, get_user_city, get_user_state)
        elsif input == "x"
            end_program 
        else
            invalid_selection
            start_program
        end
        user
    end

    def find_user_by(name) 
        User.find_by(name: name)
    end

    def create_user_by(name, city, state) 
        User.create(name: name, city: city, state: state)
    end

    def load_event_details(info)   
        events = []
        info["_embedded"]["events"].each do |event|        
            new_event = Event.new
            new_event.attraction_name = event.dig("name")
            new_event.date = event.dig("dates", "start", "localDate")
            new_event.venue = event.dig("_embedded", "venues", 0, "name")
            new_event.genre = event.dig("classifications", 0, "genre", "name")
            new_event.event_city = event.dig("_embedded", "venues", 0, "city", "name")
            new_event.event_type = event.dig("classifications", 0, "segment", "name") 
            new_event.event_status = event.dig("dates", "status", "code")
            new_event.event_state = event.dig("_embedded", "venues", 0, "state", "stateCode")
            events << new_event
        end
        save_new_events(events)
    end

    def save_new_events(events)
        events.each do |event|
            if Event.all.select {|e|e.attraction_name == event.attraction_name && e.date == event.date}.empty?
                event.save
            end           
        end
    end

    def begin_search
        puts
        puts "1. Search by event name or artist name"
        puts "2. Search by genre"
        puts "3. Search by date"
        puts "4. See all events in my city"
        puts "5. See My Tracked Events and the Current Status"
        puts "6. Change my city"
        puts "Press 's' to log out of the app"
        puts "Press 'x' to exit the app"
        case STDIN.gets.chomp
        when "1"
            display_results_by_attraction_name
        when "2"
            get_results_by_event_type
        when "3"
            display_results_by_date
        when "4"
            display_results_in_users_city    
        when "5"
            self.user.display_tracked_events
        when "6"
            change_user_city
        when "s"
            back_to_start
        when "x"
            end_program
        else
            invalid_selection
        end
        begin_search
    end

    def filter_events_by_user_city(events)
        events.select {|e|e.event_city == self.user.city && e.event_state == self.user.state} 
    end

    def display_results_by_attraction_name
        events = filter_events_by_user_city(NameSearch.new.results)
        events.empty? ? no_results_found : display_events(events)
    end

    def display_results_by_date
        events = filter_events_by_user_city(DateSearch.new.search_by_date)
        events.empty? ? no_results_found : display_events(events)
    end

    def display_results_in_users_city 
        events = Event.all.select {|e|e.event_city == self.user.city && e.event_state == self.user.state}
        display_events(events)
    end

    def display_events(events)
        puts "Here are the events available:"
        i = 1
        events = events.sort_by(&:date)
        events.each do |e| 
            puts "#{i}. " + e.event_display_format
            i = i+1
        end
        track_event(events)
    end

    def track_event(events)
        puts "Would you like to track an event's status? Enter the number of the event, or x to go back"
        input = STDIN.gets.chomp
        begin_search if input == "x"
        if (input.match? /\A\d+\z/) && (input.to_i <= events.length)
            self.user.confirm_track_event(events[input.to_i-1])
            begin_search
        else
            invalid_selection
            display_events(events)
        end
    end

    def change_user_city
        self.user.change_city
        pull_data_by_city_and_state(self.user.city, self.user.state)
    end
    
    def no_results_found
        puts
        puts "No results found. Please try again"
        puts
        begin_search
    end

    def invalid_selection
        puts
        puts "Not a valid selection. Please try again."
        puts
    end


    def back_to_start
        Menu.new.start_program 
    end 
    
    def end_program
        puts "Goodbye!"
        exit 
    end 

    def get_results_by_event_type
        events =  Event.all.select {|e|e.event_city == self.user.city && e.event_state == self.user.state}
        numbered_types = GenreSearch.new.numbered_types(events) 
        if events.empty?
            no_results_found
            begin_search
        else
            user_select_event_type(numbered_types, events)
        end 
    end 
    

    def user_select_event_type(numbered_types, events)
        puts "Please select the number of the event type you would like to see:"
        numbered_types.each {|num, type| puts "#{num}. #{type}"}
        puts "Press 's' to log out of the app"
        puts "Press 'x' to exit the app"
        user_input = STDIN.gets.chomp.downcase
        if numbered_types[user_input.to_i]
            type = numbered_types[user_input.to_i]
            results_by_genre(type, events)
        elsif user_input == "s"
            back_to_start
        elsif user_input == "x"
            end_program
        else 
            puts
            invalid_selection
            puts
            user_select_event_type(numbered_types, events)
        end
    end 

    def results_by_genre(type, events)
        events_filtered_by_type = GenreSearch.new.genre_results(type, events)
        if events_filtered_by_type.empty?
            no_results_found
            begin_search 
        end 
        user_select_genre(GenreSearch.new.numbered_genres(events_filtered_by_type)) 
    end 
    
    def user_select_genre(numbered_genres)
        puts "Please select the number of the genre you would like to see:"
        numbered_genres.each {|num, genre| puts "#{num}. #{genre}"}
        puts "Press 's' to log out of the app"
        puts "Press 'x' to exit the app"
        user_input = STDIN.gets.chomp.downcase
        if numbered_genres[user_input.to_i]
            genre = numbered_genres[user_input.to_i]
            display_genre_events(genre) 
        elsif user_input == "s"
            back_to_start
        elsif user_input == "x"
            end_program
        else 
            puts
            invalid_selection
            puts
            user_select_genre(numbered_genres)
        end 
 
    end 

    def display_genre_events(genre)
        events = Event.all.select {|e|e.event_city == self.user.city && e.event_state == self.user.state}
        if genre == "Other" 
            events_by_genre = events.select {|event|event.genre == nil || event.genre == "Undefined"}
            display_events(events_by_genre)
        else 
            events_by_genre = events.select {|event|event.genre == genre}
            display_events(events_by_genre)
        end
    end 

    def error_message
        puts
        puts "No events found in your city :("
        puts  
        puts "Press '1' to enter a new city."
        puts "Press 'x' to exit the program."        
        user_input = STDIN.gets.chomp
        if user_input == "1"
            change_user_city
        elsif user_input == "x"
            self.user.delete
            end_program
        else
            puts "Invalid entry, please try another option"
        end 
    end 

end 

