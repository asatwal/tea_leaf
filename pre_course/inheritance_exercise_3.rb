# inheritance_exercise_3.rb

module LimitSpeed
  MAX_SPEED = 80

  def speed_limit
    puts "Speed Limit is #{MAX_SPEED}"
  end

end

class Vehicle
  attr_accessor :color
  attr_reader :year
  @model
  @speed
  @engine_on

  @@num_objects = 0

  def initialize(year, color, model)
    @year = year
    self.color = color
    @model = model
    @speed = 0
    @engine_on = false
    @@num_objects += 1
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

  def self.total_objects
    puts "Total number of vehicles #{@@num_objects}"
  end
end


class MyCar < Vehicle
  
  NUMBER_OF_WHEELS = 4
  
  def spray_paint(color)
    self.color = color
  end
end


class MyTruck < Vehicle
  include LimitSpeed

  NUMBER_OF_WHEELS = 8

end


my_car = MyCar.new('1998', 'Red', 'Ferrari')

my_truck = MyTruck.new('1991', 'Blue', 'DAF')

my_truck.speed_limit

Vehicle.total_objects