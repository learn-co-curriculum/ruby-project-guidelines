class Better < ActiveRecord::Base
  def change_username(username)
    @username = username
    self.save
  end
end
