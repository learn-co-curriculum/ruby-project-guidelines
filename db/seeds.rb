require 'faker'

#key = KA7HJvpLeeJHtp4Y2SkcGVzOmw9AAmJ1
#https://app.ticketmaster.com/discovery/v2/venues.json?apikey=KA7HJvpLeeJHtp4Y2SkcGVzOmw9AAmJ1
# if you want keyword searchability, add &keyword=#{interpolated_passed_here} to the end of apikey in the url

Artist.destroy_all
ShowDate.destroy_all
Venue.destroy_all

10.times do 
    Artist.create(name:Faker::Music.band)
end
puts 'done'

10.times do
    Venue.create(name:Faker::GreekPhilosophers.name, city:Faker::Address.city, state:Faker::Address.state)
end
puts 'done'

10.times do
    ShowDate.create(date:Faker::Date.backward(days: 19000), venue_id: Venue.all.sample.id, artist_id: Artist.all.sample.id)
end
puts 'done'