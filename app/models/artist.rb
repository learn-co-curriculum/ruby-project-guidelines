class Artist < ActiveRecord::Base
    has_many :show_dates
    has_many :venues, through: :show_dates 
    
    #THIS CREATE METHOD WORKS(KEEP)
    def self.find_or_create_me(username)
        username = self.find_or_create_by(name:username)
    end 


    #THIS METHOD WORKS(KEEP) 
    def all_my_venues
       all_shows = ShowDate.all.select{|show_instance| show_instance.artist == self}
       all_shows.map{|show_instance| show_instance.venue.name} #maybe put .uniq on the end
    end 
    


end

#technically the user model

#Artist concert tracker program 