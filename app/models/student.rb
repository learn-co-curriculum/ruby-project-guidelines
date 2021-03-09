
class Student < ActiveRecord::Base 
    has_many :lessons
    has_many :tutors, through: :lessons
    
  
    def self.login_method
        puts "Enter Username"
        username = STDIN.gets.chomp
        puts "Enter Password"
        password = STDIN.gets.chomp

        #find a way to check validity of username and password
    end
    

    def self.register_method
        puts "Create Username"
        username = STDIN.gets.chomp
        puts "Create Password"
        password = STDIN.gets.chomp

    
    # Allow new user to create username and password.
    # Return to login method once user info is established.
    end

#     def schedule_lesson
#     #Enable user to schedule lesson
#     #Enable user to choose topic.
#     #Enable user to view available tutors - make sure tutor has topic in their instance.
#     #Have puts statement to confirm lesson.
#     #Set date for lesson.
#     end

#     def past_lessons
#     #Enable user to see previous lessons.
#     #Push scheduled lessons into array
#     end

#     def cancel_lesson
#     #Allow user to cancel lesson that has been scheduled.
#     #Returns cancelation confirmation.
#     end

#     def reschedule_lesson
#     #Allows user to RESCHEDULE scheduled lessons.
#     #Return confirmation for new lesson.
#     end

    
end


