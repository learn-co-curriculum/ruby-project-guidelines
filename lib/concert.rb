class Concert < ActiveRecord::Base

    belongs_to :artist
    belong_to :user

end