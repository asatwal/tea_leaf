# variable_scope_2.rb


arr = [1,2,3]

# re-assign variable to something else

arr.each do |a|
	outer_scope = a
	arr.each do |a|
	  inner_scope = a
	  puts "inner_scope=#{inner_scope} outer_scope=#{outer_scope}"
  end
end

puts outer_scope

