class Lesson < ActiveRecord::Base
    belongs_to :student
    belongs_to :tutor
   
    def self.start(student)
        puts "1. Schedule lesson"
        puts "2. View past lessons"
        puts "3. View scheduled lessons" 
        answer = STDIN.gets.chomp 
        if answer == "1" 
            schedule_lesson(student) 
        elsif answer == "2"
            past_lessons(student)
        elsif answer == "3"
            view_scheduled_lessons(student)
            #Calling scheduled_lessons method
        else
            puts "Try again"
        end
    end

    def self.schedule_lesson(student)
        puts "What would you like to learn?"
        answer = STDIN.gets.chomp 
        tutors = Tutor.where(subject: answer) 
        if tutors.exists?
            tutors.each do |tutor| 
                puts tutor.name
             answer = STDIN.gets.chomp 
                if answer == tutor.name 
                    puts "Your lesson has been scheduled with"[:tutor.name]
                elsif answer == "Toni"
                    puts "Your lesson has been scheduled with"[:tutor.name]
             #Allow student to select a tutor (Toni or Eric) and schedule lesson
             #Output lesson confirmation with puts statement.
                end
            end  
        end
    end

    def self.past_lessons(student)
        lessons = Lesson.where(student: student)
        if lessons.exists?
            lessons.each do |lesson|
                puts lesson.date
                puts lesson.topic 
                puts lesson.tutor.name
            end
        end
    end

    #Have below method called at end of schedule_lesson method above
    def self.view_scheduled_lessons(student)
        lessons = Lesson.where(student: student)
        if lessons.exists?
            lessons.each do |lesson|
                puts lesson.date
                puts lesson.topic 
                puts lesson.tutor.name
            end
        end
    end
    #     puts "These are your lessons"
    # end
end