# pass_by_ref_vs_value.rb


arr = [1,3,3,3,5,6,8,8,8]


# call a method that doesn’t mutate the caller

def update_arr1(var)
	var.uniq
end

update_arr1(arr)
puts "Pass by value #{arr}"


# call a method that mutates the caller.
def update_arr2(var)
	var.uniq!
end

update_arr2(arr)
puts "Pass by Reference #{arr}"



