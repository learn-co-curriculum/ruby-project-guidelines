class Team < ActiveRecord::Base
    has_many :matches
    has_many :stadiums, through: :matches
end
