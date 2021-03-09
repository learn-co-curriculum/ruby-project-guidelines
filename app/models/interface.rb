class Interface 
    attr_accessor :user

    def welcome
        puts "Welcome to Full Stack Tutoring!"
    end

    def login_or_register
        puts "Login or Register"
        answer = STDIN.gets.chomp
            if answer == "login"
                 # login method
            elsif answer == "register"
                 #register method
             else 
                 #error message
             end
    end 

end 

def login

end 

def register

end

def error_message
    puts "We make choices...that was a bad one."
end