# Employee -< Adoption
# Store -< Employee
class Employee < ActiveRecord::Base
    belongs_to :store
    has_many :adoptions
    has_many :pets, through: :adoptions
end