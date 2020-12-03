require_relative '../config/environment'

info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=Seattle&size=1&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
# puts info["_embedded"]["events"][0]["name"]
# puts info["_embedded"]["events"][0]["classifications"][0]["subGenre"]["name"]
# puts info["_embedded"]["events"][0]["dates"]["start"]["localDate"]
# puts info["_embedded"]["events"][0]["_embedded"]["venues"][0]["name"]
# puts info["_embedded"]["events"][0]["dates"]["status"]["code"]

def search_by_city
    puts "enter a city"
    city = gets
    info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&size=10&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
    puts event_details(info)
end

def cancelled_events_count
    info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
    info["_embedded"]["events"].select {|e|e["dates"]["status"]["code"] = "offsale"}.size
end

def event_details(info)
    events = []
    i = 1
    info["_embedded"]["events"].each do |event|
        events << "#{i}. #{event["name"]} - #{event["dates"]["start"]["localDate"]} - #{event["_embedded"]["venues"][0]["name"]} - #{event["classifications"][0]["subGenre"]["name"]}"
        i+=1
    end
    events
end

#search_by_city