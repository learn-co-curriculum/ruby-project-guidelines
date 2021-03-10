class Interface < ActiveRecord::Base
    has_many :students
    has_many :tutors
    # attr_accessor :student

    def self.welcome
        puts "Welcome to Full Stack Tutoring!"
        login_or_register 
    end

    def self.login_or_register
        puts "Login or Register"
        answer = STDIN.gets.chomp
        if answer == "login"
             @student = Student.login
        elsif answer == "register"
             @student = Student.register
        else 
            puts "We make choices...that was a bad one."
         end
         if @student 
            Lesson.start(@student) 
         end 
    end 

    



end 


