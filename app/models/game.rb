class Game < ActiveRecord::Base
  has_many :bets
  has_many :betters, through: :bets

  def result
    array = ["heads", "tails"]
    results = array.sample
    results
  end
end
