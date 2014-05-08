# name.rb

puts 'What is your first name ?'
fname = gets.chomp

puts 'What is your surname name ?'
sname = gets.chomp

puts 'Hello and good evening ' + fname + " " + sname

10.times do
  puts 'Hello and good evening ' + fname
end