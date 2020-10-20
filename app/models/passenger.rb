class Passenger < ActiveRecord::Base
    has_many :tickets
    has_many :flights, through: :tickets

    # returns an array of flights whose origin, destination, and takeoff date match input parameters
    def find_flight(origin, destination, date)

        flights = Flight.all.select {|f|
            f.origin == origin && f.destination == destination && f.departure.to_date == date.to_date
        }
        puts "Available flights: "
        flights.each {|f|
            puts "Flight ##{f.id}: Origin: #{f.origin}, Destination: #{f.destination}, Departure: #{f.departure.to_date}, Duration: #{f.duration}"
        }
        puts "\n"
        display_option_menu_from_find_flight(flights)
        
    end

    def display_option_menu_from_find_flight(flights)
        puts "Choose one of the following: "
        puts "  [1] Book a flight"
        puts "  [2] Search for new flights"
        puts "  [3] Return to main menu"
        option = gets.strip
        if option == "1"
            book_flight(flights)
        elsif option == "2"
            puts "\nOrigin: "
            new_origin = gets.strip.downcase
            puts "Destination: "
            new_destination = gets.strip.capitalize
            puts 'Date: '
            new_date = gets.strip
            find_flight(new_origin, new_destination, new_date)
        elsif option == "3"
            display_option_menu
        else
            print "Invalid option. "
            display_option_menu_from_find_flight
        end
    end
    
    # books flight from an array of flights
    def book_flight(flights)
        puts "Enter the Flight # of the flight that you would like to book: "
        flight_num = gets.to_i
        flight = flights.find {|f|
            f.id == flight_num
        }
        puts "FLIGHT: #{flight}"
        ticket = Ticket.create
        ticket.passenger = self
        ticket.flight = flight
        puts "You have successfully booked a ticket from #{flight.origin.capitalize} to #{flight.destination.capitalize} for #{flight.departure.to_date}!"
        # Ticket.view_ticket_info
        # to do: subtract price from account balance
    end

    def add_money_to_account

    end
end