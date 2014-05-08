# proc_example.rb

talk = Proc.new do
  puts "I am talking."
end

talk.call