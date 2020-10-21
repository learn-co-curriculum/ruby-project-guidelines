class User < ActiveRecord::Base
  has_one :password
end