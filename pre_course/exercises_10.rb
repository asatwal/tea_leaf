# exercises_10.rb

# Hash values can contain nested arrays

lottery_numbers_daily = { mon: [1,3,5,6,7], wed: [7,9,10,11,12], fri: [1,8,20,5,1] }

puts lottery_numbers_daily

# Array of hashes

lottery_numbers_weekly = [ { mon: [2,3,5,6,7], wed: [20,9,10,11,12], fri: [10,8,20,5,1] }, { mon: [99,3,5,6,8], wed: [98,10,10,11,12], fri: [97,8,20,5,12] } ]

puts lottery_numbers_weekly