class EmployeeSkills
    attr_accessor :id, :employee_id, :skill_id
    @@all =[]

def initalize(id=nil, employee_id, skill_id)
    @id = id
    @employee_id = employee_id
    @skill_id = skill_id
    @@all << self
end

def self.all
    @@all
end

















end