class Mytransaction < ActiveRecord::Base
    belongs_to :cart

    def self.my_history(user_name)
        list=[]
        userid=User.find_by(name:user_name).id
        Mytransaction.all.each do |m|
            if m.user_id == userid
            list.push(m)
            end
        end
    end
end