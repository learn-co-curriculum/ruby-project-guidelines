# require 'make_request.rb'

class Match < ActiveRecord::Base
    belongs_to :arena
    belongs_to :teams

    def home_team_goals
        pp match['api']['fixtures'].map{|m|m['goalsHomeTeam']}
    end

    def test
        p "it works!"
    end

end
