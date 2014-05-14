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
    @suit = suit
    @id = id
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
    @id = ACE_LOW_ID if id == ACE_HIGH_ID
  end
end
