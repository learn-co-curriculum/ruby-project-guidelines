require 'rest-client'
require 'json'
require 'pry'
# require_relative '../app/models/event.rb'

ActiveRecord::Base.establish_connection

data = RestClient.get "https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=222&apikey=6lzMfDxzzO4DBnjAU7OfrYkAlMBPcS5f"
parsed_data = JSON.parse(data)
all_events = parsed_data["_embedded"]["events"]

@events = []
@venues = []

def add_info_to_events(all_events)
  all_events.each do |event|
    new_event = {}

    new_event["name"] = event["name"]
    new_event["url"] = event["url"]
    new_event["date"] = event["dates"]["start"]["localDate"]
    new_event["price"] = (event["priceRanges"][0]["min"] + event["priceRanges"][0]["min"]) / 2
    new_event["family_friendly"] = event["ageRestrictions"]["legalAgeEnforced"]

    @events << new_event
  end
end

def add_info_to_venues(all_events)
  all_events.each do |event|
    new_venue = {}
    venue = event["_embedded"]["venues"][0]

    new_venue["name"] = venue["name"]
    new_venue["url"] = venue["url"]
    new_venue["state"] = venue["state"]["name"]
    new_venue["city"] = venue["city"]["name"]
    new_venue["postal_code"] = venue["postalCode"]

    @venues << new_venue
  end
end

add_info_to_events(all_events)
add_info_to_venues(all_events)

@events.each do |event|
  Event.create(event)
end

@venues.each do |venue|
  Venue.create(venue)
end