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
            scheduled_lessons(student)
            #Calling scheduled_lessons method
        else
            puts "Try again"
        end
    end

    def self.schedule_lesson(student)
        puts "What would you like to learn?"
        answer = STDIN.gets.chomp 
        puts "When would you like to have your lesson?"
        date = STDIN.gets.chomp
        puts "Who would you like to learn with?" 
        tutors = Tutor.where(subject: answer) 

        if tutors.exists?
            tutors.each do |tutor|
                puts "#{tutor.id}. #{tutor.name}"
            end
        end

        tutor_number = STDIN.gets.chomp
        tutor = Tutor.find_by(id: tutor_number)
        Lesson.create(topic: answer, date: date, student: student, tutor: tutor)
        puts "Your lesson has been scheduled." 
              
            
    end

    def self.past_lessons(student)
        lessons = Lesson.where(student: student).where("date < ?", Time.current)
        if lessons.exists?
            lessons.each do |lesson|
                puts "#{student.username} had a #{lesson.topic} lesson on #{lesson.date} with #{lesson.tutor.name}"
                # puts lesson.topic 
                # puts lesson.tutor.name
            end
        end
    end

    def self.scheduled_lessons(student)
        lessons = Lesson.where(student: student).where("date > ?", Time.current)
        if lessons.exists?
            lessons.each do |lesson|
                puts "#{lesson.id}. #{student.username} has a #{lesson.topic} lesson on #{lesson.date} with #{lesson.tutor.name}"
            end
            puts "Pick a lesson to reschedule or cancel."
            lesson_id = STDIN.gets.chomp 
            lesson = Lesson.find_by(id: lesson_id)
            puts "1. Reschedule"
            puts "2. Cancel"
            student_choice = STDIN.gets.chomp 
            if student_choice == "1"
                reschedule_lesson(lesson)
            elsif student_choice == "2"
                cancel_lesson(lesson)
             end
        end
    end

    def self.reschedule_lesson(lesson)
        puts "When would you like to reschedule your lesson?"
        lesson_reschedule = STDIN.get.chomp 
        lesson.update(date: lesson_reschedule)
        puts "Your lesson has been rescheduled!"
    end

    def self.cancel_lesson(lesson)
        lesson.destroy 
        puts "Your lesson has been cancelled."
    end

end