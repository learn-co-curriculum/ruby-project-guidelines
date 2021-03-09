class Tutor < ActiveRecord::Base
    belongs_to :students
    has_many :students, through: :lessons
   

    # def initialize (name, subject)
    #     @name = name
    #     @subject = subject 
    # end


end
