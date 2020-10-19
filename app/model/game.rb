require "pry"

class Game
  def result
    array = ["heads", "tails"]
    @results = array.sample
  end
end
