class Owner < ActiveRecord::Base
 has_many :tank_owner_ids
 has_many :tanks, through: :tank_owner_ids

 
end