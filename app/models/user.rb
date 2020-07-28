require 'pry'

class User < ActiveRecord::Base
   
#----I want to be able to insert new Users into our database----->
def self.search_by_name(username)
    User.all
    # binding.pry
end

end