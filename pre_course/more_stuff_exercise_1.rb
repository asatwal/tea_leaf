# more_stuff_exercise_1.rb

arr = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

arr.each do |element|

	if element.downcase.match("lab")
		puts "#{element} contains the string \"lab\""
	end
end