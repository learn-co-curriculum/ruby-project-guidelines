class Movie < ActiveRecord::Base
    belongs_to :theater
    belongs_to :genre
end
