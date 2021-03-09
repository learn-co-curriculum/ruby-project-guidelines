class Fish < ActiveRecord::Base

 belongs_to :tank
 has_many :owners, through: :tank

end