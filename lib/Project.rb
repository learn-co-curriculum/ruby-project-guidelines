class Project < ActiveRecord::Base

    belongs_to :employers
    has_many :employees












end
    # #name, id
    # attr_accessor :id, :project
    # @@all = []

    # def initalize(id=nil,project)
    #     @id=id
    #     @project = project
    #     @@all << self
    # end

    

    # def self.all
    #     @@all
    # end