require_relative '../config/environment'

info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=Seattle&size=1&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json


def search_by_city
    puts "enter a city"
    city = gets
    info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
    load_event_details(info)
end

def events_count
    info = GetRequester.new("https://app.ticketmaster.com/discovery/v2/events.json?country=usa&apikey=QATrioQ3vEzlLyBebumHRHuNBfT39vrZ").parse_json
    info["_embedded"]["events"].count 
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

def load_event_details(info)   
    events = []
    info["_embedded"]["events"].each do |event|        
        new_event = Event.new
        new_event.attraction_name = event["name"]
        new_event.date = event["dates"]["start"]["localDate"]
        new_event.venue = event["_embedded"]["venues"][0]["name"]
        new_event.genre = event["classifications"][0]["subGenre"]["name"]
        events << new_event
    end
    save_new_events(events)
end

def save_new_events(events)
    events.each do |event|
        if !Event.all.select {|e|e.attraction_name == event.attraction_name && e.date == event.date}
            event.save
        end
    end
end

def save_user(name, city)
    User.create(name: name, city: city)
end

search_by_city
