# loops_iterators_exercise_3.rb

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']


names.each_with_index do |name, x|
  puts "#{x}. #{name}"
end