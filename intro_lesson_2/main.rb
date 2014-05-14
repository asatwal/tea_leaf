# main.rb

require_relative 'blackjack.rb'


# Play the game

puts "Hello and welcome to Blackjack! What is your name ?"

player_name = gets.chomp

BlackJack.new.play(player_name)

puts "Goodbye #{player_name}!"