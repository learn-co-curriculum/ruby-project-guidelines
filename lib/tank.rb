class Tank < ActiveRecord::Base

has_many :fishs
has_many :tank_owner_ids
has_many :owners, through: :tank_owner_ids


end
