class ShowDate < ActiveRecord::Base
    belongs_to :artist
    belongs_to :venue
end 

#Create Method
def self.create_new_date(year, month, date, venue_choice, artist_id)
    self.create(date: DateTime.new(year, month, date), venue_id: venue_choice, artist_id: artist_id)
    binding.pry
end 

def tester
    puts "lol"
end 







#full CRUD 