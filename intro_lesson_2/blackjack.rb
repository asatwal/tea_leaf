# blackjack.rb


require 'pry'

require_relative 'user_responses.rb'

require_relative 'deck.rb'

require_relative 'card_game_utils.rb'

require_relative 'player.rb'



class BlackJack

  DEALER_MIN_SCORE = 17
  DEALER_NAME = 'Dealer'

  include UserResponses


  def play(player_name)

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

        if dealer.total_score > CardGameUtils::BLACKJACK_SCORE || dealer.total_score < player.total_score
          puts "#{player.name} won #{dealer.name}!"
        elsif dealer.total_score > player.total_score
          puts "#{dealer.name} won #{player.name}!"
        elsif dealer.total_score == player.total_score
          puts "#{player.name} and #{dealer.name} draw!"    
        end
      end

      puts "----------------"
    end while get_player_reponse?("Play again")

  end

  def dealer_min_score_not_reached?(player)
    player.name.eql?(DEALER_NAME) && player.total_score < DEALER_MIN_SCORE
  end

  def play_game(deck, player)

    2.times do |i|
      puts "Dealing Card #{i+1} to #{player.name}"
      player.get_next_card(deck.deal)
    end

    puts "#{player.to_s}"

    score = 0

#   binding.pry

    while dealer_min_score_not_reached?(player) || get_player_reponse?("Deal next card")

      if dealer_min_score_not_reached?(player)
        puts "Dealing Card to #{player.name} as minimum score (#{DEALER_MIN_SCORE}) not reached"
      end

      player.get_next_card(deck.deal)

      puts "#{player.to_s}"

      score = player.total_score

      break if score >= CardGameUtils::BLACKJACK_SCORE

    end

    if score == CardGameUtils::BLACKJACK_SCORE
      puts "Well done #{player.name}! You won"
    elsif score > CardGameUtils::BLACKJACK_SCORE
      puts "Ha! You lost #{player.name}!"
    end
    
  end
end





