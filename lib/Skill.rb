class Skill
    #id, name
    @@all = []
    
    attr_accessor :id, :name
    def initalize(id=nil, name)
        @id = id
        @name = name  
        @@all << self
    end

    def self.all
        @@all
    end 

end