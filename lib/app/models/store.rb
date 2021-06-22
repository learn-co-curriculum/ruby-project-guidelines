# Store -< Employee
class Store < ActiveRecord::Base
    has_many :employees
end