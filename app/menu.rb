require_relative '../config/environment'
class Menu 
    attr_accessor :user

    def initialize 
        @user = user
    end

    def start_program
        puts "Welcome to EventFinder!"
        self.user = create_user(get_user_name, get_user_city, get_user_state)# add ,get_user_state the end later
        pull_data_by_city_and_state(self.user.city, self.user.state)#add ,self.user.state
        puts "Thank you, #{user.name}"

        begin_search
    end

    def get_user_name
        puts "Please enter your name"
        user_name = STDIN.gets.chomp
        user_name
    end

    def get_user_city
        puts "Please enter your City"
        user_city = STDIN.gets.chomp
        user_city
    end

    def get_user_state
        puts "Please enter your State (ex. WA, CA, NY)"
        user_state = STDIN.gets.chomp
        user_state
    end

    def create_user(name, city, state)
        User.create(name: name, city: city, state: state)
    end


    def pull_data_by_city_and_state(city, state)
        info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&stateCode=#{state}&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json

    def find_or_create_user_by(name, city, state) 
        User.find_or_create_by(name: name, city: city, state: state)
    end

        load_event_details(info)
    end


    def load_event_details(info)   
        events = []
        info["_embedded"]["events"].each do |event|        
            new_event = Event.new
            new_event.attraction_name = event["name"]
            new_event.date = event["dates"]["start"]["localDate"]
            new_event.venue = event["_embedded"]["venues"][0]["name"]
            new_event.genre = event["classifications"][0]["subGenre"]["name"]
            #new_event.event_status = event["dates"]["status"]["code"]
            events << new_event
        end
        save_new_events(events)
    end

    def save_new_events(events)
        events.each do |event|
            if !Event.all.select {|e|e.attraction_name == event.attraction_name && e.date == event.date}
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

        puts "Press 's' to return to start"

        puts "Press 'x' to exit the program"
        user_input = STDIN.gets.chomp
        if user_input == "1"
            display_results_by_attraction_name
        elsif user_input == "2"
            #display_results_by_date
        elsif user_input == "3"
            #
        elsif user_input == "s"
            back_to_start
        elsif user_input == "x"
            end_program
        else
            puts "Invalid entry, please try another option"
            begin_search
        end
    end

    def display_results_by_attraction_name
        puts "Please enter the event or artist you would like to see:"
        user_input = STDIN.gets.chomp
        events = Event.all.select {|event|event.attraction_name.split.any?(user_input)}
        display_events(events)
    end

    def display_events(events)
        i = 1
        events.each do |e| 
            puts "#{i}. #{e.attraction_name} - #{e.date} - #{e.venue}" 
            i = i+1
        end
    end 

end

def back_to_start
    Menu.new.start_program 
end 

def end_program
    puts "goodbye!"
    exit 
end 

