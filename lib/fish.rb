class Fish

    attr_reader :name, :type, :size

    @@all = []

    def initialize(name, type, size)
        @name = name
        @type = type
        @size = size 
    end

    def self.all
        @@all
    end

end