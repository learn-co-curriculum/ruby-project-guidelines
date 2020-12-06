class Match < ActiveRecord::Base
    belongs_to :arena
    belongs_to :teams
end
