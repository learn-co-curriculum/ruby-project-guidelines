class Theater < ActiveRecord::Base
     has_many :tickets
     has_many :guests, through: :tickets
     has_many :movies 

    #  def self.theaters
    #     #return theaters
    #     #MAYBE RETURN THEATERS AND THEIR MOVIES
        # end
end
