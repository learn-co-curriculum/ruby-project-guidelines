class Venue < ActiveRecord::Base
    has_many :show_dates
    has_many :artists, through: :show_dates

    def find_venue(keyword) 
        res = GetRequester.new("https://app.ticketmaster.com/discovery/v2/venues.json?apikey=KA7HJvpLeeJHtp4Y2SkcGVzOmw9AAmJ1&keyword=#{keyword}")
        data = res.parse_json
        data["_embedded"]["venues"][0]["name"] 
    end 
end