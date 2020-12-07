require_relative '../config/environment'
class Menu 
    attr_accessor :user

    def initialize 
        @user = user
    end

    def start_program
        puts "Welcome to Event Tracker! This app will allow you to track your favorite events and see their current status."
        self.user = get_user
        pull_data(self.user.city, self.user.state)
        puts "Thank you, #{user.name}"
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

    # def pull_data_by_city_and_state(city, state)
    #     info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&stateCode=#{state}&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
    #     info["page"]["totalElements"] == 0 ? error_message : load_event_details(info)
    # end

    def pull_data(city, state)
        page_has_data = true
        page = 1
        while page_has_data && page < 4
            path = "https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&stateCode=#{state}&page=#{page}&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ"
            page_data = GetRequester.new(path).parse_json
            if page_data.dig("page", "totalElements") == 0 || nil
                page_has_data = false
                error_message
            else 
                load_event_details(page_data)
                page += 1
            end
        end       
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
        events.select {|e|e.event_city == self.user.city} 
    end

    def display_results_by_attraction_name
        events = NameSearch.new.results
        events.empty? ? no_results_found : display_events(events)
    end

    def display_results_by_date
        events = filter_events_by_user_city(DateSearch.new.search_by_date)
        events.empty? ? no_results_found : display_events(events)
    end

    def display_results_in_users_city 
        events = Event.all.select {|e|e.event_city == self.user.city}
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
        if input.match? /\A\d+\z/
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
        puts "No results found. Please try again"
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
        events = Event.all.select {|event|event.event_city.split.any?(user.city.capitalize) || event.event_city.split.any?(user.city)}  
        if events.empty?
            no_results_found
            begin_search
        else
            i = 1
            type_nums = {}
            event_types = events.map{|event| event.event_type}.uniq
            event_types.each do |type|
            type_nums[i] = type
            i += 1
            end
        end 
    
    user_select_event_type(type_nums, events)
    end 

    def user_select_event_type(type_nums, events)
        puts "Please select the number of the event type you would like to see:"
        type_nums.each {|num, type| puts "#{num}. #{type}"}
        #puts "Press 'a' to see all events" << functionality to be added
        puts "Press 's' to log out of the app" #to do - put these repeating phrases in a method in case we update
        puts "Press 'x' to exit the app"
        user_input = STDIN.gets.chomp.downcase
        type_nums.each do |num, type|
            if user_input == num.to_s
                get_results_by_genre(type)
            end 
        end
    end 

    def get_results_by_genre(type)
        events = Event.all.select {|event|event.event_type == type}
        if events.empty?
            no_results_found
            begin_search
        else
            i = 1
            genre_nums = {}
            event_genres = events.map{|event| event.genre}.uniq
            event_genres.each do |genre|
            genre_nums[i] = genre
            i += 1
            end
        user_display_genre(genre_nums)
        end 
    end 
    
    def user_display_genre(genre_nums)
        puts "Please select the number of the genre of you would like to see:"
        genre_nums.each {|num, genre| puts "#{num}. #{genre}"}
        puts "Press 's' to log out of the app" #to do - put these repeating phrases in a method in case we update
        puts "Press 'x' to exit the app"
        user_input = STDIN.gets.chomp.downcase
            genre_nums.each do |num, genre|
                if user_input == num.to_s
                    display_genre_events(genre)
                end 
            end 
        end 

    def display_genre_events(genre)
        events = Event.all.select {|event|event.genre == genre}
        if events.empty?
            no_results_found
            begin_search
        else
            display_events(events)
        end
    end 


end





















































#tester method only. to use, add call to method within normal run sequence
def classification_tester(info)
    info["_embedded"]["events"].each do |event|
        puts "#{event["_embedded"]["venues"][0]["city"]["name"]} - #{event["classifications"][0]["genre"]["name"]} - #{event["classifications"][0]["segment"]["name"]}"
    end 
end 

def error_message
    puts
    puts "No events found in your city :(" #can make this a more generic message if we want to use this error method elsewhere
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

