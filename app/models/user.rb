class User < ActiveRecord::Base
  has_many :venues
  has_many :events, through: :venue

  def valid_user?(name)
    if User.find_by username: name
      true
    else
      false
    end
  end

  def create_account(username)
    puts "First time user? Please create a password:"
    password = gets.chomp
  
    create_user_hash(username, password)
    user = User.new(@user_hash)
    user.save
    @current_user = user
  end

  def user_is_valid(name)
    @current_user = User.find_by username: name
    password = gets.chomp
    if correct_password?(name, password)
      puts "Logged in!"
    else
      puts "Sorry, that wasn't quite right. Try again:"
      user_is_valid(name)
    end
  end

 
end