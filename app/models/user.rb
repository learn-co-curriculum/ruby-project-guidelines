class User < ActiveRecord::Base
    has_many :tickets
    has_many :events, through: :tickets

    def my_upcoming_events
        self.tickets.all.map {|t|t.event}.sort_by(&:date)
    end

    def display_user_information
        puts self.name
        puts "#{self.city}, #{self.state}"
        press_any_key_to_go_back
    end

    def display_tracked_events
        self.my_upcoming_events.empty? ? display_has_no_saved_events : show_events
        press_any_key_to_go_back
    end

    def show_events
        puts
        puts "Here are your saved events:"
        self.my_upcoming_events.each {|event|puts event_display_format(event)}
    end

    def display_has_no_saved_events
        puts
        puts "You are not tracking any events at this time"
        puts
    end

    def confirm_track_event(event)
        puts event_display_format(event)
        puts "Confirm you would like to track this event. Y or N."
        y_n_input = STDIN.gets.chomp.downcase
        if y_n_input == "y"
            Ticket.create(user_id: self.id, event_id: event.id)
            puts
            puts "Now tracking event: " 
            puts event_display_format(event)
            puts
        elsif y_n_input == "n"
            puts "Returning to search results..."
            puts
        else
            puts "Not a valid selection. Please enter Y or N:"
            puts
            confirm_track_event(event)
        end
    end

    def event_display_format(event)
        "#{event.attraction_name}. Current status: #{event.event_status.capitalize}. Scheduled for #{event.date_display_format}, at #{event.venue}."
    end

    def change_city
        puts "Please enter your city:"
        self.city = STDIN.gets.chomp.split.map(&:capitalize).join(' ')
        puts "Please enter your State: (WA, CA, FL...)"
        self.state =  STDIN.gets.chomp.upcase
    end

    def press_any_key_to_go_back
        puts
        puts "Press Enter to continue."
        gets
    end
end