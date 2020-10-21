require 'rest-client'
require 'json'
require 'pry'

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

def add_info_to_venues
  
end

add_info_to_events(all_events)