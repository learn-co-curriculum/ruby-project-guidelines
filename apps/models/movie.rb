class Movie < ActiveRecord::Base
    belongs_to :theater
    belongs_to :genre

    # @@all = []

    # def initialize
    #     @@all<<self
    # end
    
    # def all 
    #     @@all
    # end


    # def self.browse
    #     #return all movies
    # end



    # def self.browse_by_genre(genre)
    #     #given argument of a genre returns list of all movies associated with genre)
        
    #     ####Solution1####
    #     #assign genre object a variable
    #     #call and return variables movies w/ variable.movies

    #       ###Solution2###
    #     #find genres genre_id
    #     #iterate through movies
    #     #select ones that have said genre_id => return array
    #     #use that array find each movie title
    #     #return each movie title in array
        
    
    #  end

   

end
