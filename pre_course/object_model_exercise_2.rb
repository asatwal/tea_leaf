# object_model_exercise_2.rb

module MyFirstModuleUtils
	def print_msg
		puts "Hello from Module!"
	end
end

class MyFirstClass
	include MyFirstModuleUtils
end

my_first_class = MyFirstClass.new
my_first_class.print_msg