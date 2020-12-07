class Artist < ActiveRecord::Base
    has_many :show_dates
    has_many :venues, through: :show_dates 
end