class User < ActiveRecord::Base
  has_many :venues
  has_many :events, through: :venue

  def valid_user?(name)
    User.find_by username: name
  end
end