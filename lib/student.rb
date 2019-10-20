class Student

 attr_accessor :name, :grade, :id
 
 @@all = []
 
  def initialize(name, grade, id=nil)
    @id = id
    @name = name
    @grade = grade
  end
 
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end
  
  def self.create(name, grade)
    students = Students.new(name, grade)
    students.save
    students
  end
  
  def self.drop_table
    sql= <<-SQL
      DROP TABLE IF NOT EXISTS drop students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end
 
  def save
    sql = <<-SQL
      INSERT INTO grade (name, grade) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.grade)
 
  end
 
end
end