# blackjack.rb

$LOAD_PATH << '.'

require 'pry'

require 'user_responses'



class Card
  SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

  # All Cards have a Card ID to identifier them within the suit
  # - IDs must be unique
  # - Cards 1..10 have ID 1..10 respectively
  # - Others IDs are defined below

  ACE_LOW_ID  = 0
  ACE_HIGH_ID = 1
  JACK_ID     = 11
  QUEEN_ID    = 12
  KING_ID     = 13

  PICTURE_CARD_DESCRIPTION = { ACE_LOW_ID => 'Ace', ACE_HIGH_ID => 'Ace', JACK_ID => 'Jack', QUEEN_ID => 'Queen', KING_ID => 'King' }

  attr_accessor :suit, :id

  def initialize(suit, id)
    self.suit = suit
    self.id = id
  end

  def value
    if id == ACE_HIGH_ID
      value = 11
    elsif id == ACE_LOW_ID
      value = 1      
    elsif id >= JACK_ID
      value = 10
    else
      # All other IDs (1..10) reflect the card value
      value = id 
    end
  end

  def to_s
    if PICTURE_CARD_DESCRIPTION.key?(id)
      "#{PICTURE_CARD_DESCRIPTION[id]} of #{suit}"
    else
      "#{id} of #{suit}"
    end
  end

  def set_low_ace
    self.id = ACE_LOW_ID if id == ACE_HIGH_ID
  end
end


class Deck

  def initialize
    reset
  end

  def reset

    @cards = []

    Card::SUITS.each do |suit|
      (1..13).each do |i|
        @cards << Card.new(suit, i)
      end
    end
  end

  def deal
    @cards.pop
  end

  def shuffle
    # Use time in micro seconds and the seed for random number generation
    @cards.shuffle!(random: Random.new(Time::now.usec))
  end

  def to_s
    puts "Deck of Cards"
    @cards.each { |card| puts card }
  end
end


class Player

  attr_accessor :name

  def initialize(name)
    @cards = []
    self.name = name
  end

  def get_next_card(card)

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
      @cards.each { |card| score += card.value }

      break if (score <= BlackJack::BLACKJACK_SCORE)

      # Exit loop unless we  have any high values aces 
      recalculate = false

      # Have gone bust
      # - check if we have any Aces with high value and change to low value followed by recalc
      @cards.each do |card|
        if card.value == 11
          card.set_low_ace
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
    @cards.each { |card| puts card }
    puts "Total score: #{total_score}"
  end

end



class BlackJack

  BLACKJACK_SCORE = 21
  DEALER_MIN_SCORE = 17
  DEALER_NAME = 'Dealer'

  include UserResponses


  def run
    puts "Hello and welcome to Blackjack! What is your name ?"

    player_name = gets.chomp


    begin
      deck = Deck.new
      puts " "
      puts "----------------"
      3.times { |i| puts "Shuffle Cards #{i+1}"; deck.shuffle }


      player = Player.new(player_name)

      play_game(deck, player)

      if player.total_score < 21
        dealer = Player.new(DEALER_NAME)

        puts "----------------"
        play_game(deck, dealer)

        if dealer.total_score > BLACKJACK_SCORE || dealer.total_score < player.total_score
          puts "#{player.name} won #{dealer.name}!"
        elsif dealer.total_score > player.total_score
          puts "#{dealer.name} won #{player.name}!"
        elsif dealer.total_score == player.total_score
          puts "#{player.name} and #{dealer.name} draw!"    
        end
      end

      puts "----------------"
    end while get_player_reponse?("Play again")

    puts "Goodbye #{player_name}!"
  end

  def dealer_min_score_not_reached?(player)
    player.name.eql?(DEALER_NAME) && player.total_score < DEALER_MIN_SCORE
  end

  def play_game(deck, player)

    2.times do |i|
      puts "Dealing Card #{i+1} to #{player.name}"
      player.get_next_card(deck.deal)
    end

    puts player

    score = 0

#   binding.pry

    while dealer_min_score_not_reached?(player) || get_player_reponse?("Deal next card")

      if dealer_min_score_not_reached?(player)
        puts "Dealing Card to #{player.name} as minimum score (#{DEALER_MIN_SCORE}) not reached"
      end

      player.get_next_card(deck.deal)

      puts player

      score = player.total_score

      break if score >= BLACKJACK_SCORE

    end

    if score == BLACKJACK_SCORE
      puts "Well done #{player.name}! You won"
    elsif score > BLACKJACK_SCORE
      puts "Ha! You lost #{player.name}!"
    end
    
  end
end

# RUn the game

BlackJack.new.run



