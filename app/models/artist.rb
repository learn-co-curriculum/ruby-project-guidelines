class Artist < ActiveRecord::Base
    has_many :show_dates
    has_many :venues, through: :show_dates 
    
    #THIS "ME" METHOD WORKS(KEEP)
    def self.me(username)
        self.all.find_or_create_by(name:username)
    end 

    def self.show_my_venue_name
        ShowDate.all.select do |performance| 
            binding.pry
            performance.artist_id == self.id
        end 
        
    end 

    def delete_myself(username)
        
    end 

        




end

#technically the user model

#Artist concert tracker program 