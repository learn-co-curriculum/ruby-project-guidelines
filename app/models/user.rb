class User < ActiveRecord::Base
  attr_accessor :username
  has_one :password

  def initialize(username)
    @username = username
  end
end