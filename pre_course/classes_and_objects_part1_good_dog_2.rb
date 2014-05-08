# classes_and_objects_part1_good_dog_2.rb

class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"

