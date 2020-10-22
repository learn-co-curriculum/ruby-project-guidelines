class User < ActiveRecord::Base
  has_many :venues
  has_many :events, through: :venue
end