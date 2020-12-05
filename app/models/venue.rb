class Venue < ActiveRecord::Base
    has_many :show_dates
    has_many :artists, through: :show_dates

    
end