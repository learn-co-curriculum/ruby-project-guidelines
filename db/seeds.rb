require 'pry'

require_relative 'lib/student.rb'
require_relative 'lib/lesson.rb'
require_relative 'lib/tutor.rb'


barak = Student.create(username: "Barak", password: "123") 
nyasha = Student.create(username: "Nyasha", password: "1234")

eric = Tutor.create(name: "Eric", subject: "Math")
sean = Tutor.create(name: "Sean", subject: "English")
toni = Tutor.create(name: "Toni", subject: "Math")
justin = Tutor.create(name: "Justin", subject: "Science")

math = Lesson.create(topic: "Math", date: "Monday", student_id: , tutor_id: )
english = Lesson.create(topic: "English", date: "Tuesday", student_id: , tutor_id: )
science = Lesson.create(topic: "Science", date: "Wednesday", student_id: , tutor_id: )
math2 = Lesson.create(topic: "Math", date: "Thursday", student_id: , tutor_id: )

# nyasha = Student.new(name = "Nyasha", subject = "Math")
# barak = Tutor.new(name = "Barak", subject = "Math")
# lesson = Lesson.new(topic = "math", date = "Monday", student_id = 1, tutor_id = 1)



binding.pry