class Sale < ActiveRecord::Base
    belongs_to :employee
    belongs_to :product
    belongs_to :customer
end