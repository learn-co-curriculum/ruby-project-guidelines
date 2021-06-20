class Store < ActiveRecord::Base
    belongs_to :employee
    belongs_to :pet
end