class Passenger < ActiveRecord::Base
    has_many :tickets
    has_many :flights, through: :tickets
end