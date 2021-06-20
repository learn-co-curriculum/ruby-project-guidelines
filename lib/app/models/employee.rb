# Employee -< Store
class Employee < ActiveRecord::Base
    has_many :stores
    has_many :pets, through: :stores
end