class Mytransaction < ActiveRecord::Base
    belongs_to :cart

    def self.my_history(user_name)
        list=[]
        tranlist=[]
        userid=User.find_by(name:user_name).id
        Mytransaction.all.each do |m|
            
            if m.user_id == userid
                list.push(m)
            end
        end
        list.each do |m|
            itemname=Item.find_by(id:m.item_id).name
            puts "                                    "
            tranlist.push( "You purchased #{itemname} on #{m.created_at}")
        end
        tranlist
    end
end