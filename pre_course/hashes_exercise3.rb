# hashes_exercise3.rb

name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}

name_and_age.each_key do |k|
  puts k
end

name_and_age.each_value do |k|
  puts k
end

name_and_age.each do |k,v|
  puts k
  puts v
end