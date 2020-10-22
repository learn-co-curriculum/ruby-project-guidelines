require 'rest_client'
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
    new_event["genre"] = event["classifications"][0]["genre"]["name"]
    new_event["family_friendly"] = event["ageRestrictions"]["legalAgeEnforced"]
    new_event["venue_id"] = event["_embedded"]["venues"][0]["id"]

    if event["priceRanges"] != nil
      new_event["price"] = (event["priceRanges"][0]["max"] + event["priceRanges"][0]["min"]) / 2
    end

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
    new_venue["venue_id"] = venue["id"]

    @venues << new_venue
  end
end

add_info_to_events(all_events)
add_info_to_venues(all_events)

binding.pry