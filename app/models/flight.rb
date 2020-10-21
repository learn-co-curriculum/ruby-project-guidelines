class Flight < ActiveRecord::Base
    has_many :tickets
    has_many :passengers, through: :tickets


    # returns an array of flights whose origin, destination, and takeoff date match input parameters
    def self.find_flight(origin, destination, date)

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

end