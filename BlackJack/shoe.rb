require_relative 'deck'

class Shoe < Deck
  AVERAGE_HAND_SIZE = 6
  
  MAX_DECKS = 8
  
  MIN_DECKS = 1
  
  attr_reader :num_decks, :cards
  
  def initialize(num_decks)
    @num_decks = num_decks
    @cards = []
    
    if not num_decks.is_a?(Integer) \
      or num_decks < MIN_DECKS or \
      num_decks > MAX_DECKS
      raise ArgumentError "Num_decks must be [#{MIN_DECKS}...#{MAX_DECKS}]"
    end
    
    i = 0
    1.upto(num_decks) do |x|
      @cards += super().cards
    end
    
  end
  
  def to_s
    return "[#{num_decks} deck shoe]\n" + super
  end
  
  def can_play(player_cnt)
    if @cards.length >= player_cnt * AVERAGE_HAND_SIZE
      return 1
    else
      return nil
    end
  end
  
  def deal_card
    if @cards.length > 0 then
      return @cards.slice!(0)
    else
      return StandardError "No cards left in the shoe; please use can_play"
    end
  end
  
  def deal_hand(player_index, player_cnt)
    if can_play(player_cnt - player_index) then
      return [ @cards.slice!(0), @cards.slice!(player_cnt - player_index - 1) ]
    else
      return StandardError "Not enough cards left in shoe, please use can_play"
    end
  end

end

newshoe = Shoe.new(3)
puts newshoe.to_s
puts "--------"
newshoe.shuffle
puts newshoe.deal_hand(1,2)
