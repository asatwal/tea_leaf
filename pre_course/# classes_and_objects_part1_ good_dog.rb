# classes_and_objects_part1_good_dog.rb

class GoodDog
  def initialize(name)
    @name = name
  end

   def speak
    "#{@name} says Arf!"
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

end

sparky = GoodDog.new("Sparky")

puts sparky.speak           # => Arf!
puts sparky.name

sparky.name = "Spartacus"
puts sparky.name