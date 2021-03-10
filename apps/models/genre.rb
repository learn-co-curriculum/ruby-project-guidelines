class Genre < ActiveRecord::Base
    has_many :movie 
end