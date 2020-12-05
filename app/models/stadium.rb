class Stadium < ActiveRecord::Base
    has_many :matches
    has_many :teams, through: :matches
end
