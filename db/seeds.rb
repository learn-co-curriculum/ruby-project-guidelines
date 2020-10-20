require 'rest-client'
require 'json'
require 'pry'

data = RestClient.get "https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=222&apikey=6lzMfDxzzO4DBnjAU7OfrYkAlMBPcS5f"
parsed_data = JSON.parse(data)

binding.pry
