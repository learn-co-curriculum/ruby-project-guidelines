class Artist < ActiveRecord::Base
    has_many :show_dates
    has_many :venues, through: :show_dates 
end

#This is to test our git branch push and pulls. please delete if you can pull this, Hunter. 