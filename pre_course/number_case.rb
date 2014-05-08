# number_case.rb

puts "Enter a number"

num = gets.chomp.to_i

def eval_num(num)
	case
	  when ( num >= 0 && num <= 50)
			"#{num} is between 0 and 50"
	  when ( num > 50 && num <= 100)
		  "#{num} is between 51 and 100"
	  when ( num > 100 )
		  "#{num} is greater THAN 100"
		else
			"#{num} Not a recognised number"
	end
end

puts eval_num(num)
