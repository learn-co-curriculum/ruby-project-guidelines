class Customer < ActiveRecord::Base
    has_many :sales
end