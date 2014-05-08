# inheritance_exercise_7.rb

class Student

  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    @grade = grade
  end

  def better_grade_than?(student)
  	@grade > student.grade
  end

  protected

	attr_accessor :grade

end


joe = Student.new("Joe", 5)
bob = Student.new("Bob", 3)

puts "Well done!" if joe.better_grade_than?(bob)