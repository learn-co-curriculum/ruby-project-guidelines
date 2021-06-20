# Employee -< Store
class Employee
    has_many :stores
    has_many :pets, through: :stores
end