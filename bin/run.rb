require_relative '../config/environment'

info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ")
puts info.parse_json
