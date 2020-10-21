# This class is for flights that have been searched but have not been saved in the DB. 
# The DB stores flights that are booked by one or more passengers and are represented by the Flight class.
# SearchedFlight is a simple struct-like class for passing info from the API to the controller that deals with flight-booking logic.

require_relative '../../bin/api_info'

class SearchedFlight
    attr_accessor :origin, :destination, :departure, :carrier_id, :price

    def initialize(origin, destination, departure, carrier_id, price)
        @origin = origin
        @destination = destination
        @departure = departure
        @carrier_id = carrier_id
        @price = price
    end

    # returns an array of flights whose origin, destination, and takeoff date match input parameters
    def self.find_and_print_flight(origin, destination, date)

        flights = get_flight_info(origin, destination, date)
        puts "Available flights: "
        flight_num = 1
        flights.each {|f|
            # Rodrigo: add the airline information here
            # 1. create an airline table 
            # 2. using carrier ID you should be able to print the actual airline name in the string below. 
            # 3. Maybe you can add a feature to the main menu where the user can see how many times he flied each carrier. 
            puts "#{flight_num} Origin: #{origin}, Destination: #{destination}, Departure: #{f.departure.to_date}, Price: #{f.price}"
            flight_num += 1
        }
        puts "\n"
        return flights
    end
end