class Theater < ActiveRecord::Base
    has_many :guests, through: :tickets
end
