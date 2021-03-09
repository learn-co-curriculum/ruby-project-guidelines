require 'pry'

require_relative 'lib/student.rb'
require_relative 'lib/lesson.rb'
require_relative 'lib/tutor.rb'


barak = User.create(username: "Barak", password: 

nyasha = Student.new(name = "Nyasha", subject = "Math")
barak = Tutor.new(name = "Barak", subject = "Math")
lesson = Lesson.new(topic = "math", date = "Monday", student_id = 1, tutor_id = 1)



binding.pry