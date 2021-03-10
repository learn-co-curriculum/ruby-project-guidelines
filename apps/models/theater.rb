class Theater < ActiveRecord::Base
    has_many :guest :through :ticket
end
