class Interface
    
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
            puts "We make all choices...that was a bad one."
         end
         if @student 
            Lesson.start(@student) 
         elsif 
            Interface.welcome
         end 
    end 

end 


