class ShowDate < ActiveRecord::Base
    belongs_to :artist
    belongs_to :venue

    # def create_date_for_artist(artist_name)
    #     artist_date = ShowDate.find_or_create_by(date:) 
    #     binding.pry
    # end 


end

#full CRUD 