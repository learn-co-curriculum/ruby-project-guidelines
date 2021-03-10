class Lesson < ActiveRecord::Base
    belongs_to :student
    belongs_to :tutor
   
    def self.start(student)
        puts "1. Schedule lessons"
        puts "2. View past lessons"
        puts "3. View scheduled lessons" 
        answer = STDIN.gets.chomp 
        if answer == "1" 
            schedule_lesson(student) 
        elsif answer == "2"
            past_lessons(student)
        elsif answer == "3"
            #Call view scheduled lessons method
        else
            puts "Try again"
        end
    end

    def self.schedule_lesson(student)
        puts "What would you like to learn?"
            answer = STDIN.gets.chomp 
        puts "When would you like to have your lesson?"
            date = STDIN.gets.chomp
        puts "Please enter your username."
            name = STDIN.gets.chomp
        puts "Who would you like to learn with?"
            puts Tutor.all
            tutor = STDIN.gets.chomp
            # tutors = Tutor.where(subject: answer) 
            #     if tutors.exists?
            #         tutors.each do |tutor| 
            #             puts tutor.name
            #         end
            #         puts "Please select a tutor."                   
            #         response = STDIN.gets.chomp 
            #         Tutor.find_by(name: response)
                    Lesson.create(topic: answer, date: date, student: name, tutor: tutor)
                    # if response == tutors.name
                    #     return "Your lesson has been scheduled." 
                 
       
                    #   
            #         puts "Your lesson has been scheduled."
            #  #Allow student to select a tutor (Toni or Eric) and schedule lesson
            #  #Output lesson confirmation with puts statement.
               
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

    def self.scheduled_lessons(student)

    end

end