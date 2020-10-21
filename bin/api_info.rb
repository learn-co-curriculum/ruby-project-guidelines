require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require_relative '../config/environment'

# Quotes

def access_api(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = ''  # change this with the api key before running.

    response = http.request(request).read_body
    response_hash = JSON.parse(response)    
end

def get_place(query)
    url = URI("https://rapidapi.p.rapidapi.com/apiservices/autosuggest/v1.0/US/USD/en-US/?query=#{query}")

    response_hash = access_api(url)
    response_hash["Places"][0]["PlaceId"]
end

def get_api(origin, destination, date)
    origin = get_place(origin)
    destination = get_place(destination)
    url = URI("https://rapidapi.p.rapidapi.com/apiservices/browseroutes/v1.0/US/USD/en-US/#{origin}/#{destination}/#{date}?inboundpartialdate=anytime")

    response_hash = access_api(url)
end 

def get_flight_info(origin, destination, date)
    results = []

    origin = origin.downcase
    destination = destination.downcase
    info_hash = get_api(origin, destination, date)
    flights = info_hash["Quotes"].select {|f|
        f["OutboundLeg"]["DepartureDate"].to_date == date.to_date
    }
    
    flights.each {|f|
        flight = Flight.create
        flight.origin = origin
        flight.destination = destination
        flight.departure = f["OutboundLeg"]["DepartureDate"]
        flight.save
        results << flight
    }
    
    results
end

puts Flight.all
puts Ticket.all
puts Passenger.all

binding.pry

