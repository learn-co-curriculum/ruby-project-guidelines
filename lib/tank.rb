class Tank

    attr_reader :name, :fish_limit

    @@all = []

    def initialize(name, fish_limit)
        @name = name
        @fish_limit = fish_limit
    end

    def self.all
        @@all
    end


end
