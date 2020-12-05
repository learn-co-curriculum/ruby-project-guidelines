class Match < ActiveRecord::Base
    belongs_to :stadium
    belongs_to :teams
end
