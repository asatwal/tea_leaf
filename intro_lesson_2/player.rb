
require_relative 'card_game_utils.rb'

require_relative 'card.rb'

class Player

  attr_accessor :name

  def initialize(name)
    @cards = []
    @name = name
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

      break if (score <= CardGameUtils::BLACKJACK_SCORE)

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

