class Employee
    #name, id, project_id
    attr_accessor :id, :name, :employeer, :project_id
    @@all = []

    def initalize(id = nil, name, employeer) #, project_id = nil)
        @id=id
        @name = name
        # @project_id = project_id
        @employeer = employeer
        @@all << self
    end


    def self.all
        @@all
    end

    #basic save method to add new record into database using sql. Note requires .update method
    # def save
    #     if self.id
    #       self.update
    #     else
    #       sql = <<-SQL
    #         INSERT INTO employee (name, project_id, employeer_id)
    #         VALUES (?, ?, ?)
    #       SQL
    
    #      DB[:conn].execute(sql, self.name, self.project_id,employeer_id)
    #      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
    #    end
    #  end

    # #create new instance method
    # def self.create(name, employeer, project_id=Nil)
    #     employee = Employee.new(name, employeer.id)
    #     employee.save
    #     employee
    #   end
    
    #   def self.find_by_id(id)
    #     sql = "SELECT * FROM employee WHERE id = ?"
    #     result = DB[:conn].execute(sql, id)[0]
    #     Employee.new(result[0], result[1], result[2])
    #   end
    
    #   def update
    #     sql = "UPDATE employee SET name = ?, employeer_id = ?, project_id, WHERE id = ?"
    #     DB[:conn].execute(sql, self.name, self.employeer_id, self.project_id self.id)
    #   end


end

