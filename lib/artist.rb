class Artist < ActiveRecord::Base

    has_many :concerts
    has_many :users, through: :concerts

end