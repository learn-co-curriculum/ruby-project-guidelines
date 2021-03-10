class Guest < ActiveRecord::Base
    has_many :ticket
end