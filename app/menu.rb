require_relative '../config/environment'
class Menu 
    attr_accessor :user

    def initialize 
        @user = user
    end

    def start_program
        puts "Welcome to EventFinder!"
        self.user = get_user
        pull_data_by_city_and_state(self.user.city, self.user.state)
        puts "Thank you, #{user.name}"

        begin_search
    end

    def get_user_name
        puts "Please enter your full name"
        STDIN.gets.chomp
    end

    def get_user_city
        puts "Please enter your City"
        STDIN.gets.chomp
    end

    def get_user_state
        puts "Please enter your State (ex. WA, CA, NY)"
        STDIN.gets.chomp
    end

    def pull_data_by_city_and_state(city, state)
        info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&stateCode=#{state}&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
        if  info["page"]["totalElements"] == 0 
            error_message
        else  
        load_event_details(info)
        end 
    end
  
    def get_user
        puts "Enter 1 to Log in, or 2 to Create a new account, or x to exit the application"
        input = STDIN.gets.chomp
        if input == "1" 
            user = find_user_by(user_name = get_user_name)
            if !user
                puts "Account information not found. Would you like to make an account? Y / N "
                STDIN.gets.chomp == "y" ? user = create_user_by(user_name, get_user_city, get_user_state) : back_to_start
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
            new_event.attraction_name = event["name"]
            new_event.date = event["dates"]["start"]["localDate"]
            new_event.venue = event["_embedded"]["venues"][0]["name"]
            new_event.genre = event["classifications"][0]["genre"]["name"] #changed subGenre to genre here
            new_event.event_city = event["_embedded"]["venues"][0]["city"]["name"]
            new_event.event_type = event["classifications"][0]["segment"]["name"] 
            #new_event.event_status = event["dates"]["status"]["code"]
            events << new_event
        end
        save_new_events(events)
    end

    def save_new_events(events)
        events.each do |event|
            if Event.all.select {|e|e.attraction_name == event.attraction_name && e.date == event.date}.empty?
                event.save
            end           
            Event.order(date: :asc)
        end
    end

    def begin_search
        puts "1. Search by event name or artist name"
        puts "2. Search by genre"
        puts "3. Search by date"
        puts "4. See My Tickets"
        puts "Press 's' to log out of the app"
        puts "Press 'x' to exit the app"
        user_input = STDIN.gets.chomp
        if user_input == "1"
            display_results_by_attraction_name
        elsif user_input == "2"
            #display_results_by_genre
        elsif user_input == "3"
            #display_results_by_date
        elsif user_input == "4"
            display_user_tickets
        elsif user_input == "s"
            back_to_start
        elsif user_input == "x"
            end_program
        else
            invalid_selection
            begin_search
        end
    end

    def display_results_by_attraction_name
        puts "Please enter the event or artist you would like to see:"
        user_input = STDIN.gets.chomp.downcase.split(" ")
        events = []
        user_input.each do |word|
            found_events = Event.all.select {|event|event.attraction_name.split.any?(word.capitalize) || event.attraction_name.split.any?(word)}.uniq
            found_events.each {|e| events << e} 
        end
        if events.empty?
            no_results_found
            begin_search
        else
        display_events(events.uniq)
        end
    end

    def display_events(events)
        puts "Here are the events available:"
        i = 1
        events.each do |e| 
            puts "#{i}. #{e.attraction_name} - #{e.date} - #{e.venue}" 
            i = i+1
        end
        buy_ticket(events)
    end

    def buy_ticket(events)
        puts "Would you like to buy a ticket for an event? Enter the number of the event, or x to go back"
        input = STDIN.gets.chomp
        begin_search if input == "x"
        choice = events[input.to_i-1]
        if choice
            puts "#{choice.attraction_name} - #{choice.date} - #{choice.venue}"
            puts "Confirm you would like to buy a ticket for this event. Y or N."
            y_n_input = STDIN.gets.chomp
            if y_n_input == "y"
                self.user.buy_ticket(choice)
                puts "Congratulations, #{self.user.name}. Enjoy #{choice.attraction_name} on #{choice.date}, at #{choice.venue}"
                begin_search
            elsif y_n_input == "n"
                begin_search
            else
                invalid_selection
                display_events(events)
            end
        else
            invalid_selection
            display_events(events)
        end
    end

    def display_user_tickets
        puts "Here are the events #{self.user.name} has a ticket for:"
        user_events = self.user.tickets.all.map {|t|t.event}
        if !user_events.empty?
            user_events.each {|e|puts "#{e.attraction_name} on #{e.date}, at #{e.venue}"}
            press_any_key_to_go_back
            begin_search
        else
            puts "You have no tickets at this time"
            press_any_key_to_go_back
            begin_search
        end
    end
    
    def no_results_found
        puts "No results found. Please try again"
    end

    def invalid_selection
        puts "Not a valid selection. Please try again."
    end

    def press_any_key_to_go_back
        puts "Press Enter to continue."
        input = gets
        if input
        end
    end

    def back_to_start
        Menu.new.start_program 
    end 
    
    def end_program
        puts "Goodbye!"
        exit 
    end 


end




















































#tester method only. to use, add call to method within normal run sequence
def classification_tester(info)
    info["_embedded"]["events"].each do |event|
        puts "#{event["_embedded"]["venues"][0]["city"]["name"]} - #{event["classifications"][0]["genre"]["name"]} - #{event["classifications"][0]["segment"]["name"]}"
    end 
end 

def error_message
    self.user.delete
    puts
    puts "No events found in your city :(" #can make this a more generic message if we want to use this error method elsewhere
    puts  
    puts "Press 's' to return to start"
    puts "Press 'x' to exit the program"        
    user_input = STDIN.gets.chomp
    if user_input == "s"
        back_to_start
    elsif user_input == "x"
        end_program
    else
        puts "Invalid entry, please try another option"
    end 
end 

