class Tutor < ActiveRecord::Base
    belongs_to :student
    has_many :student, through: :lesson
   

    # def initialize (name, subject)
    #     @name = name
    #     @subject = subject 
    # end


end
