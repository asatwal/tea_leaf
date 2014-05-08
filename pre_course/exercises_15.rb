# exercises_15.rb

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|word| word.start_with?("s")}

puts "Starts with \"s\""
puts arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|word| word.start_with?("s", "w")}

puts "Starts with \"s\" or \"w\""
puts arr