class Project
    #name, id
    attr_accessor :id, :project
    @@all = []

    def initalize(id=nil,project)
        @id=id
        @project = project
        @@all << self
    end

    

    def self.all
        @@all
    end

end
