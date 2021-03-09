class Interface < ActiveRecord::Base
    has_many :students
    has_many :tutors
    # attr_accessor :student

    def self.welcome
        puts "Welcome to Full Stack Tutoring!"
    end

    def self.login_or_register
        puts "Login or Register"
        answer = STDIN.gets.chomp
            if answer == "login"
                 Student.login_method
            elsif answer == "register"
                 Student.register_method
             else 
                puts "We make choices...that was a bad one."
             end
    end 

end 


