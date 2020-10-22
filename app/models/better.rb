class Better < ActiveRecord::Base
  has_many :bets
  has_many :games, through: :bets

  # def change_username(username)
  #   @username = username
  #   self.save
  # end
end
