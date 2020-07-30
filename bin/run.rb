require_relative '../config/environment'
require "tty-prompt"
def welcome_user
    puts "*******************************"
    puts "       Welcome To Our          "
    puts "        PC Store App           "
    puts "*******************************"
 end
 
 #-----Runs our code----->
 def run
     welcome_user
     create_new_user_if_not_exist
     select_or_not?
     check_out?
     clear_cart_after_checkout
 end

 #------Method lets us know if user exists or not------>
 def create_new_user_if_not_exist
      puts "                           "
      prompt = TTY::Prompt.new
      $username = prompt.ask("Sign-in with your Username.")
      namelist=[]
      User.all.each do |m|
      namelist.push(m.name)
      end
      Item.show_list
   
    if namelist.include? $username
         puts "Welcome back."
         puts "                           "
         search_for
    else
        newuser=User.create(name: $username)
        search_for
    end
 end

 #---show the list of available Items--->
 def search_for
   choices = %w(Dell Samsung HP) 
   prompt = TTY::Prompt.new
   item_brand=prompt.multi_select("What are you looking for?",choices)
   computerlist=[]
   item_brand.each do |m|
      computerlist.push(Item.search_by_name(m)) 
   end
   $choices=[]
   computerlist.each do |m|
      m.each do |n|
      $choices.push(n.name)
      end
   end
   computerlist
 end
 
 def select_or_not?
   choices = %w(Yes No) 
   prompt = TTY::Prompt.new
   opt=prompt.select("Is there anything you like?",choices)
   if opt=="Yes"
      choose_your_item
   else
      puts "Try Aonther search"
      Item.show_list
      select_or_not?
    end
end

def choose_your_item
   prompt=TTY::Prompt.new
   item_name=prompt.select("Please choose the item name",$choices)
   $itemchoosed = Item.all.find_by(name:item_name)
   newuser= User.all.find_by(name:$username)
   newcart= Cart.create(user_id: newuser.id, item_id: $itemchoosed.id)
   newtran=Cart.make_my_transaction(newcart)
 end

#---Checking out-->
 def check_out?
   choices = %w(Yes No) 
   prompt = TTY::Prompt.new
   opt=prompt.select("Do you want to check out?",choices)
   newuser= User.all.find_by(name:$username)
   if opt=="Yes"
      User.total(newuser)
      review_or_not?
    else
        choose_your_item
        check_out?
    end
 end

 def review_or_not?
   newuser= User.all.find_by(name:$username)
      list=[]
      Review.all.each do |m|
         if m.user_id==newuser.id
            list.push(m)
         end
      end
      useritemid=[]
      list.each do |n|
         useritemid.push(n.item_id)
      end
   Cart.all.each do |m|
      if useritemid.exclude? ($itemchoosed.id)
         choices = %w(1 2 3 4 5) 
         prompt=TTY::Prompt.new
         star_count=prompt.select("How many stars you would like to give #{Item.find_by(id:$itemchoosed.id).name}?",choices)
         newreview=Review.create(star:star_count, user_id:newuser.id, item_id:$itemchoosed.id)
      else
         puts "                               "
         puts "You already reviewed this item."
         choices = %w(Edit Delete) 
         prompt=TTY::Prompt.new
         answer=prompt.select("Do you want to edit or delete your review?",choices)
            if answer =="Delete"
               Review.find_by(item_id: $itemchoosed.id).delete
            elsif answer =="Edit"
               Review.find_by(item_id: $itemchoosed.id).delete
               choices = %w(1 2 3 4 5) 
               prompt=TTY::Prompt.new
               star_count=prompt.select("How would you like to edit your review for #{Item.find_by(id:$itemchoosed.id).name}?",choices)
               newreview=Review.create(star:star_count, user_id:newuser.id, item_id:$itemchoosed.id)
            end
      end
   end
   see_your_history?
 end

 #---Checking out history-->
   def see_your_history?
      choices = %w(Yes No) 
      prompt = TTY::Prompt.new
      opt=prompt.select("Do you want to see all your review?",choices)
      if opt=="Yes"
         puts "                             "
         puts Review.see_my_review($username)
         choices = %w(Yes No) 
         prompt = TTY::Prompt.new
         opt=prompt.select("Do you want to see all your transaction?",choices)
         if opt=="Yes"
            puts Mytransaction.my_history($username)
         end
      else
      choices = %w(Yes No) 
      prompt = TTY::Prompt.new
      opt=prompt.select("Do you want to see all your transaction?",choices)
      if opt=="Yes"
            puts Mytransaction.my_history($username) 
         end  
      end  
   end
 #---Clear cart & End-->
 def clear_cart_after_checkout
   puts "                               "
   puts "************Bye Bye************"
   puts "                               "
    Cart.destroy_all
 end

 run

#  User.destroy_all
#  Review.destroy_all
#  Mytransaction.destroy_all


