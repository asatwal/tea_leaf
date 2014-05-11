# blackjack.rb

BLACKJACK_SCORE = 21
DEALER_MIN_SCORE = 17
DEALER_NAME = 'Dealer'
RESPONSE_VALUES = ['Y', 'N']


class Card
  SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

  # All Cards have a Card ID to identifier them within the suit
  # - IDs must be unique
  # - Cards 1..10 have ID 1..10 respectively
  # - Others IDs are defined below

  ACE_HIGH_ID = 0
  ACE_LOW_ID  = 14
  JACK_ID     = 11
  QUEEN_ID    = 12
  KING_ID     = 13

  PICTURE_CARD_DESCRIPTION = { ACE_HIGH_ID => 'Ace', JACK_ID => 'Jack', QUEEN_ID => 'Queen', KING_ID => 'King', ACE_LOW_ID => 'Ace'}

  def self.value(card)
  	return if card.empty? || !card.key?(:id)

    if card[:id] == ACE_HIGH_ID
    	value = 11
    elsif card[:id] == ACE_LOW_ID
    	value = 1
    elsif card[:id] >= JACK_ID
    	value = 10
    else
    	# All other IDs (1..10) reflect the card value
    	value = card[:id] 
  	end
  end

  def self.description(card)
  	return if card.empty? || !card.key?(:suit) || !card.key?(:id)
  	if PICTURE_CARD_DESCRIPTION.key?(card[:id])
      "#{PICTURE_CARD_DESCRIPTION[card[:id]]} of #{card[:suit]}"
  	else
  		"#{card[:id]} of #{card[:suit]}"
  	end
  end

end


class Deck

  def initialize
  	reset
  end

  def reset

  	@cards = []

  	Card::SUITS.each do |suit|
  		(0..13).each do |i|
        @cards << { suit: suit, id: i }
  		end
  	end
  end

  def get_card
  	@cards.pop

  end

  def shuffle
  	# Use time in micro seconds and the seed for random number generation
    @cards.shuffle!(random: Random.new(Time::now.usec))
  end

  def to_s
  	puts "Deck of Cards"
  	@cards.each { |card| puts "#{card} DESCRIPTION:#{Card.description(card)} VALUE:#{Card.value(card)}" }
  end

end

class Player

  attr_accessor :name

  def initialize(name)
  	@cards = []
    @name = name
  end

  def add_card(card)
  	return if card.empty? || !card.key?(:suit) || !card.key?(:id)

  	if @cards.empty?
  	  @cards[0] = card
  	else
  	  @cards << card
  	end
  end

  def total_score
  	recalculate = true
  	score = 0

  	begin
  	  score = 0
  	  @cards.each { |card| score += Card.value(card) }

  	  break if (score <= BLACKJACK_SCORE)

  	  # Exit loop unless we  have any high values aces 
  	  recalculate = false

  	  # Have gone bust
  	  # - check if we have any Aces with high value and change to low value followed by recalc
  	  @cards.each do |card|
  	  	if card[:id] == Card::ACE_HIGH_ID
  	  		card[:id] = Card::ACE_LOW_ID
  	  		recalculate = true
  	  		# Only change first high value Ace encountered
  	  		break
  	  	end
  	  end

  	end while recalculate

  	return score
  end

  def to_s
  	puts "----------------"
  	puts "#{@name} Cards: "
  	Array(@cards).each { |card| puts "#{Card.description(card)}" }
  	puts "Total score: #{total_score}"
  end

  def dealer_min_score_not_reached?
    name.eql?(DEALER_NAME) && total_score <= DEALER_MIN_SCORE
  end

  def play_game(deck)

    2.times do |i|
	    puts "Dealing Card #{i+1} to #{name}"
      add_card(deck.get_card)
    end

    to_s

    score = 0

  	while dealer_min_score_not_reached? || get_player_reponse?("Deal next card")

      if dealer_min_score_not_reached?
      	puts "Dealing Card to #{name} as minimum score (#{DEALER_MIN_SCORE}) not reached"
      end

  		add_card(deck.get_card)

  		to_s

  		score = total_score

      break if score >= BLACKJACK_SCORE

  	end

    if score == BLACKJACK_SCORE
      puts "Well done #{name}! You won"
    elsif score > BLACKJACK_SCORE
      puts "Ha! You lost #{name}!"
    end
    
  end

end

def get_player_reponse?(display_text)

  puts "#{display_text} ? (Y/N)"

  response = ''

  loop do 
    response =  gets.chomp.upcase

    if RESPONSE_VALUES.include?(response)
      break
    else
      puts "Invalid Input"
    end
  end

  if response.eql?('Y')
  	return true
  else
  	return false
  end

end



puts "Hello and welcome to Blackjack! What is your name ?"

player_name = gets.chomp

begin

	deck = Deck.new
  puts " "
  puts "----------------"
	3.times { |i| puts "Shuffle Cards #{i+1}"; deck.shuffle }


	player = Player.new(player_name)

	player.play_game(deck)

	if player.total_score < 21
		dealer = Player.new(DEALER_NAME)

    puts "----------------"
		dealer.play_game(deck)

		if dealer.total_score > BLACKJACK_SCORE || dealer.total_score < player.total_score
			puts "#{player.name} won #{dealer.name}!"
		elsif dealer.total_score > player.total_score
			puts "#{dealer.name} won #{player.name}!"
		elsif dealer.total_score == player.total_score
	    puts "#{player.name} and #{dealer.name} draw!"		
		end
	end

  puts "----------------"

end while get_player_reponse?('Play again')

puts "Goodbye #{player_name}!"
