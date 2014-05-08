# number.rb

puts "Enter a number"

num = gets.chomp.to_i

if ( num >= 0 && num <= 50)
	puts "Number is between 0 and 50"
elsif ( num > 50 && num <= 100)
	puts "Number is between 51 and 100"
elsif ( num > 100 )
	puts "Number is greater THAN 100"
end


