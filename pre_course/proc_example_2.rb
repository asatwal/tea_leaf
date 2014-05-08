# proc_example_2.rb

talk = Proc.new do |name|
  puts "I am talking to #{name}."
end

talk.call("Bill")