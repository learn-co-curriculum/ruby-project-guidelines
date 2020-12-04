require 'faker'

#key = KA7HJvpLeeJHtp4Y2SkcGVzOmw9AAmJ1
#https://app.ticketmaster.com/discovery/v2/venues.json?apikey=KA7HJvpLeeJHtp4Y2SkcGVzOmw9AAmJ1
# if you want keyword searchability, add &keyword=#{interpolated_passed_here} to the end of apikey in the url

# in config/environment.rb add this line:
# ActiveRecord::Base.logger = nil

Artist.destroy_all
ShowDate.destroy_all
Venue.destroy_all

# drake = Artist.create(name: "drake")
# slim = Artist.create(name: "slim")
# nas = Artist.create(name: "nas")

# v1 = Venue.create(name: "Tuscaloosa Ampitheater", city: "Tuscaloosa", state: "Alabama")
# v2 = Venue.create(name: "The Greek", city: "Los Angeles", state: "California")
# v3 = Venue.create(name: "The Gorge Ampitheater", city: "George", state: "Washington")

# sd1 = ShowDate.create(date:Faker::Date.backward(days: 19000), venue_id: Venue.all.sample.id, artist_id: Artist.all.sample.id)
# sd2 = ShowDate.create(date:Faker::Date.backward(days: 19000), venue_id: Venue.all.sample.id, artist_id: Artist.all.sample.id)
# sd3 = ShowDate.create(date:Faker::Date.backward(days: 19000), venue_id: Venue.all.sample.id, artist_id: Artist.all.sample.id)
15.times do 
    Artist.create(name:Faker::Music.band)
end
puts 'done'

15.times do
    Venue.create(name:Faker::GreekPhilosophers.name, city:Faker::Address.city, state:Faker::Address.state)
end
puts 'done'

15.times do
    ShowDate.create(date:Faker::Date.backward(days: 19000), venue_id: Venue.all.sample.id, artist_id: Artist.all.sample.id)
end
puts 'done'