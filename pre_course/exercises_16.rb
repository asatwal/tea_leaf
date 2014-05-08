# exercises_16.rb

arr = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

arr.map! {|words| words.split(/ /)}

arr.flatten!

print arr