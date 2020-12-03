class Menu
    attr_accessor :user

    def initialize 
        @user = user
    end

    def start_program
        puts "Welcome to EventFinder!"
        self.user = create_user(get_user_name, get_user_city)# add ,get_user_state the end later
        pull_data_by_city_and_state(self.user.city)#add ,self.user.state
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
        # if zip_code_valid?(user_zip.to_i)
        #     puts "Zip Code valid."
        # else
        #     puts "Zip Code not valid, please try again."
        #     get_user_zip
        # end
        # user_zip.to_i
        user_city
    end

    def get_user_state
        puts "Please enter your State"
        user_state = STDIN.gets.chomp
        user_state
    end

    def zip_code_valid?(zip)
        if zip.is_a? Integer 
            if zip.digits.count == 5
                true
            else 
                false
            end
        else
            false
        end
    end


    def create_user(name, city) #add state later
        User.create(name: name, city: city)
    end

    def pull_data_by_city_and_state(city) #add state later
        info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&radius=50&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
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
            #display_events(events)
        end
    end

    def begin_search
        puts "1. Search by event name or artist name"
        puts "2. Search by genre"
        puts "3. Search by date"
        puts "Press 'x' to exit the program"
        user_input = STDIN.gets.chomp
        if user_input == "1"
            display_results_by_attraction_name
        elsif user_input == "2"
            #
        elseif user_input == "3"
            #
        elseif user_input == "x"
            exit
        else
            puts "Invalid entry, please try another option"
            begin_search
        end
    end

    def display_results_by_attraction_name
        puts "Please enter the event or artist you would like to see:"
        user_input = STDIN.gets.chomp
        #need to do trick where string can be any part of event.name, "rage" returns "Rage against the machine"
        events = Event.all.select {|event|event.attraction_name == user_input}
        puts events.map {|e|e.attraction_name}
    end

end

