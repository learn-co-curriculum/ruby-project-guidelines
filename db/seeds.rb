require 'pry'

require_all 

Student.destroy_all 
Tutor.destroy_all
Lesson.destroy_all


barak = Student.create(username: "Barak", password: "123") 
nyasha = Student.create(username: "Nyasha", password: "1234")

eric = Tutor.create(name: "Eric", subject: "Math")
sean = Tutor.create(name: "Sean", subject: "English")
toni = Tutor.create(name: "Toni", subject: "Math")
justin = Tutor.create(name: "Justin", subject: "Science")

math = Lesson.create(topic: "Math", date: "08/08/2021 9:00am", student: barak, tutor: eric )
english = Lesson.create(topic: "English", date: "08/08/2021 10:00am", student: nyasha, tutor: sean )
science = Lesson.create(topic: "Science", date: "22/02/2021 11:00am", student: barak, tutor: toni )
math = Lesson.create(topic: "Math", date: "22/02/2021 8:00am", student: nyasha, tutor: justin )

# nyasha = Student.new(name = "Nyasha", subject = "Math")
# barak = Tutor.new(name = "Barak", subject = "Math")
# lesson = Lesson.new(topic = "math", date = "Monday", student_id = 1, tutor_id = 1)


