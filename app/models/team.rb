class Team < ActiveRecord::Base
    has_many :matches
    has_many :arenas, through: :matches

    


end



