class Tutor < ActiveRecord::Base
   
    has_many :lessons
    has_many :students, through: :lessons
   
    

    # def initialize (name, subject)
    #     @name = name
    #     @subject = subject 
    # end


end
