# inheritance_private_methods.rb

# Private methods

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def public_disclosure
    puts "#{self.name} in human years is #{human_years}" # Can't use self on private methods
  end

  private

  def human_years
    self.age / DOG_YEARS
  end

end

sparky = GoodDog.new("Sparky", 4)

sparky.public_disclosure
