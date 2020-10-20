class Game < ActiveRecord::Base
  def result
    array = ["heads", "tails"]
    @results = array.sample
  end
end
