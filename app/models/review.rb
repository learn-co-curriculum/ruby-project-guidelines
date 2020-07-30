class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :item
    
    def self.see_my_review(user_name)
        list=[]
        Review.all.each do |m|
            if m.user.name==user_name
                list.push(m)
            end
        end
        reviewlist=[]
        list.each do |n|
            reviewlist.push( "Hello #{user_name}, you gave the #{n.item.name} #{n.star} stars.")
            end
        puts reviewlist    
    end

end