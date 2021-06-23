# Pet -< Adoption
class Pet < ActiveRecord::Base
    has_many :adoptions
    has_many :employees, through: :adoptions
end