class ShowDate < ActiveRecord::Base
    belongs_to :artist
    belongs_to :venue
end 

def self.show_or_create(year, month, date)
    binding.pry
    self.find_or_create_by(date: Time.now(year, month, date))
end 

def self.test
    puts "helo"
end 




#full CRUD 