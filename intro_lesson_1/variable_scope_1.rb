# variable_scope_1rb

localvar = 100

arr = [1,3,3,3,5,6,8,8,8]

# re-assign variable to something else

arr.each do |a|
	localvar = a
end

puts localvar

# call a method that doesn’t mutate the caller

def update_arr1(var)
	var.uniq
end

update_arr1(arr)
puts arr


# call a method that mutates the caller.
def update_arr2(var)
	var.uniq!
end

update_arr2(arr)
puts arr



