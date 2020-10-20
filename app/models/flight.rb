class Flight < ActiveRecord::Base
    has_many :tickets
    has_many :passengers, through: :tickets
end