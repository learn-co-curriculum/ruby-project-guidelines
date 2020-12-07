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

    def display_tickets
        puts "Here are the events #{self.name} has a ticket for:"
        self.my_upcoming_events.empty? ? display_has_no_tickets : show_events
        press_any_key_to_go_back
    end

    def show_events
        self.my_upcoming_events.each {|e|puts "#{e.attraction_name} on #{e.date}, at #{e.venue}. Status: #{e.event_status}"}
    end

    def display_has_no_tickets
        puts "You have no tickets at this time"
    end

    def confirm_buy_ticket(event)
        puts "#{event.attraction_name} - #{event.date} - #{event.venue}"
        puts "Confirm you would like to buy a ticket for this event. Y or N."
        y_n_input = STDIN.gets.chomp.downcase
        if y_n_input == "y"
            Ticket.create(user_id: self.id, event_id: event.id)
            puts
            puts "Congratulations, #{self.name}. Enjoy #{event.attraction_name} on #{event.date}, at #{event.venue}"
            puts 
        elsif y_n_input == "n"
            puts "Returning to search results..."
            puts
        else
            puts "Not a valid selection. Please enter Y or N:"
            puts
            confirm_buy_ticket?(event)
        end
    end

    def change_city
        puts "Please enter your city:"
        self.city = STDIN.gets.chomp.capitalize
        puts "Please enter your State: (WA, CA, FL...)"
        self.state = STDIN.gets.chomp.upcase
    end

    def press_any_key_to_go_back
        puts
        puts "Press Enter to continue."
        gets
    end
end