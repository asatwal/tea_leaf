# classes_and_objects_part1_exercise_1.rb


class MyCar
  @color
  @year
  @model
  @speed
  @engine_on

  def initialize(year, color, model)
    @year = year
    @color = color
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
    "Model:#{@model} Year:#{@year} Color:#{@color} Speed:#{@speed} Engine On:#{@engine_on}"
  end
end

my_car = MyCar.new('1998', 'Red', 'Ferrari')
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
puts my_car.info




