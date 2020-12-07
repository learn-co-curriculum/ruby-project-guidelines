require 'faker'

Artist.destroy_all
ShowDate.destroy_all
Venue.destroy_all

# 15.times do 
#     Artist.create(name:Faker::Music.band)
# end
# puts 'done'

100.times do
    Venue.create(name:Faker::GreekPhilosophers.name, city:Faker::Address.city, state:Faker::Address.state)
end
puts 'done'

# 15.times do
#     ShowDate.create(date:Faker::Date.forward(days: 23), venue_id: Venue.all.sample.id, artist_id: Artist.all.sample.id)
# end
# puts 'done'