# classes_and_objects_part1_exercise_3.rb

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"