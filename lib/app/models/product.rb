class Product < ActiveRecord::Base
    has_many :sales
    has_many :employees, through: :sales
end