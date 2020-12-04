class Artist < ActiveRecord::Base
    has_many :show_dates
    has_many :venues, through: :show_dates 
    
    #THIS CREATE METHOD WORKS(KEEP)
    # def self.find_or_create_me(username)
    #     username = self.find_or_create_by(name:username)
    # end 

    # def create_date_for_artist
    #     ShowDate.find_or_create_by(date: datetime) 
    #     binding.pry
    # end 

        #helper function to get primary key ID
    # def self.all_venue_id
    #     artist_id_array = ShowDate.ids 
    # end 

    # def self.show_venue_name(username)
    #     artist_venue = [] 
    #     ShowDate.all.select do |info| 
    #         #binding.pry
    #         if info.artist.name == username 
    #             return info.venue.name
    #         else
    #             return "please create an account"
    #         end 
    #     end 
    # end

    # def delete_myself(username)
    #     if username == self 
    #         self
    # end 

end

#technically the user model

#Artist concert tracker program 