class User < ActiveRecord::Base

    has_many :concerts
    has_many :artists through: :concerts

end