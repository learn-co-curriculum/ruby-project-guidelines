class Venue < ActiveRecord::Base
    has_many :show_dates
    has_many :artists, through: :show_dates

    def self.get_cities
        self.all.map{|venue_instance| venue_instance.city}.uniq
    end 
end