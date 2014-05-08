# inheritance_exercise_6.rb

class Vehicle
  attr_accessor :color
  attr_reader :year
  @model
  @speed
  @engine_on

  def initialize(year, color, model)
    @year = year
    self.color = color
    @model = model
    @speed = 0
    @engine_on = false
  end

  def brake(speed)
    @speed -= speed
  end

  def speed_up(speed)
    @speed += speed
    @engine_on = true
  end

  def engine_off
    @speed  = 0
    @engine_on = false
  end

  def info
    "Model:#{@model} Year:#{self.year} Color:#{self.color} Speed:#{@speed} Engine On:#{@engine_on}"
  end

  def self.gas_mileage(litres, miles)
    puts "#{miles / litres} miles per litre of gas"
    
  end

  def to_s
    self.info
  end

  def age
    calculate_age
  end

  private

  def calculate_age
    Time.now.year - self.year
  end

end


class MyCar < Vehicle
  
  NUMBER_OF_WHEELS = 4
  
  def spray_paint(color)
    self.color = color
  end

  def to_s
    puts "My Car: #{self.info}"
  end
end


class MyTruck < Vehicle
  
  NUMBER_OF_WHEELS = 8

  def to_s
    puts "My Truck: #{self.info}"
  end

end


my_car = MyCar.new(1998, 'Red', 'Ferrari')
puts my_car.info     

my_car.speed_up(100)
puts my_car.info   
my_car.speed_up(100)
my_car.speed_up(100)
my_car.speed_up(100)
puts my_car.info  
my_car.brake(300)
puts my_car.info  
my_car.engine_off
my_car.spray_paint("Green")
puts my_car.info

MyCar.gas_mileage(80, 450)

puts "Age in years: #{my_car.age}"

puts my_car




