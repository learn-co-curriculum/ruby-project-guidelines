class TankOwnerId < ActiveRecord::Base

    belongs_to :owner 
    belongs_to :tank 

end