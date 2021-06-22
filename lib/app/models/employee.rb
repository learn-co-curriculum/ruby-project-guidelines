# Employee -< Adoption
class Employee < ActiveRecord::Base
    has_many :adoptions
    has_many :pets, through: :adoptions
end