class Flight < ActiveRecord::Base
    has_many :tickets
    has_many :passengers, through: :tickets

    def self.find_matching_flight(searchedflight)
        return self.find_by(origin: searchedflight.origin,
            destination: searchedflight.destination,
            departure: searchedflight.departure,
            carrier_id: searchedflight.carrier_id
        )
    end

    def self.create_from_searchedflight(searchedflight)
        origin = searchedflight.origin
        destination = searchedflight.destination
        departure = searchedflight.departure
        carrier_id = searchedflight.carrier_id

        new_flight = self.create
        new_flight.origin = origin
        new_flight.destination = destination
        new_flight.departure = departure
        new_flight.carrier_id = carrier_id
        new_flight.save
        return new_flight
    end

    def list_of_passengers
        passengers = Passenger.all.select {|p| p.flights.include?(self)}
    
        passenger_name = passengers.map {|p| p.name}
        puts "Passenger Manifest: #{passenger_name}"
    
    end
    
    
    def flight_info
        origin = self.origin
        destination = self.destination
        departure = self.departure
    
        puts "Depart From:#{origin}"
        puts "Arrive: #{destination}"
        puts "Depart On: #{departure}"
    
    end








end