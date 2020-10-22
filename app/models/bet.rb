class Bet < ActiveRecord::Base
  belongs_to :better
  belongs_to :game
end
