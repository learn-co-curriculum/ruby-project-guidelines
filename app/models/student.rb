
class Student < ActiveRecord::Base 
    has_many :lesson
    has_many :tutor, through: :lesson
    
  

    

    #def initialize (new, subject)
    #    @name = name
    #    @subject = subject
  #  end


    def login
    #Allow user to log in.
    #If login info is invalid return error message using "puts" statement
    end

    def register
    #Allow new user to create username and password.
    #Return to login method once user info is established.
    end

    def schedule_lesson
    #Enable user to schedule lesson
    #Enable user to choose topic.
    #Enable user to view available tutors - make sure tutor has topic in their instance.
    #Have puts statement to confirm lesson.
    #Set date for lesson.
    end

    def past_lessons
    #Enable user to see previous lessons.
    #Push scheduled lessons into array
    end

    def cancel_lesson
    #Allow user to cancel lesson that has been scheduled.
    #Returns cancelation confirmation.
    end

    def reschedule_lesson
    #Allows user to RESCHEDULE scheduled lessons.
    #Return confirmation for new lesson.
    end

    
end


