class Employeer
    attr_accessor :id, :name

    @@all = []

    def initalize (id=nil,name)
        @id=id
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end

end