class Game < ActiveRecord::Base

  # def result
  #   array = ["heads", "tails"]
  #   @results = array.sample
  # end
  def self.start
    self.new
  end
end
