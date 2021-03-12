class Theater < ActiveRecord::Base
     has_many :tickets
     has_many :guests, through: :tickets
     has_many :movies 
end

