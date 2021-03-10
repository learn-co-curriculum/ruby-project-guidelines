
class Student < ActiveRecord::Base 
    has_many :lessons
    has_many :tutors, through: :lessons
    
  
    def self.login
        puts "Enter Username"
        username = STDIN.gets.chomp
        puts "Enter Password"
        password = STDIN.gets.chomp

        Student.find_by(username: username, password: password)
#Search db for entered username and password 
        #find a way to check validity of username and password
    end

  
    

    def self.register
        puts "Create Username"
        username = STDIN.gets.chomp
        puts "Create Password"
        password = STDIN.gets.chomp
    
        Student.create(username: username, password: password)
    # Allow new user to create username and password.
    # Return to login method once user info is established.
    end

    
    
end


