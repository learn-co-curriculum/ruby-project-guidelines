class Genre < ActiveRecord::Base
    has_many :movies

    # def self.genres
    #     #return all genres
    # end

end