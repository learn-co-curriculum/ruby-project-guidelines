class ProjectSkills < ActiveRecord::Base

    belongs_to :skills
    belongs_to :projects

end



    # attr_accessor :id, :project_id, :skill_id

    # @@all=[]

    # def initalize(id=nil,project_id,skill_id)
    #     @id=id
    #     @project_id=project_id
    #     @skill_id=skill_id
    #     @@all<<self
    # end

    # def self.all
    #     @@all
    # end