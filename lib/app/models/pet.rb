class Pet < ActiveRecord::Base
    has_many :stores
    has_many :employees, through: :stores
end