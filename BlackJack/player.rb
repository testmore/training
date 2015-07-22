require_relative 'hand'

class Player
  
  MAX_HAND = 4
  
  attr_accessor :name, :bankroll, :bet, :hands
  attr_reader :num_hands
  
  @@bankroll = 0
  @@total_hands = 0
  
  def initialize (name, bankroll)
    @name = name
    @bankroll = bankroll
    @bet = 0
    @num_hands = 0
    @hands = []
    @@bankroll += bankroll
  end
  
  def to_s
    result = @name
    if self.has_a_hand and not self.is_dealer
      result += " [\$#{@bet.to_s}]"
    end
    result += " [\$#{@bankroll.to_s}]"
    return result
  end
  
  def bankroll_to_s
    return "#@name [\$#{@bankroll.to_s}]"
  end
  
  def summary
    return "#@name [#@num_hands hand(s)] [\$#{@bankroll.to_s}]"
  end
  
  def hand_to_s(hand)
    result = @name
    i = @hands.index(hand)
    if i and @hands.length > 1 and not self.is_dealer
      result += " [Hand #{i + 1}] [\$#{hand.bet.to_s}]"
    elsif self.has_a_hand and not self.is_dealer
      result += " [\$#{@bet.to_s}]"
    end
    result += " [\$#{@bankroll.to_s}]"
    return result
  end
  
  def all_bankrolls
    return @@bankroll
  end
  
  def start_hand
    @num_hands += 1
    @@total_hands += 1
    i = @hands.length
    @hands[i] = Hand.new
    self.place_bet(@hands[i])
    return @hands[i]
  end
  
  def place_bet(hand)
    hand.bet = @bet
    @bankroll -= @bet
    @@bankroll -= @bet
  end
  
  def place_insurance_bet(hand, insurance_bet)
    hand.insurance_bet = insurance_bet
    @bankroll -= insurance_bet
    @@bankroll -= insurance_bet
  end
  
  def win_insurance_bet(hand, winnings)
    @bankroll += winnings
    @@bankroll += winnings
    #hand.insurance_bet = 0
  end
  
  def lose_insurance_bet(hand)
    #hand.insurance_bet = 0
  end
  
  def finish_round
    @hands = []
  end
  
  def has_a_hand
    return 1 if @hands.length > 0
    return nil
  end
  
  def has_max_hands
    return 1 if @hands.length == MAX_HANDS
    return nil
  end
  
  def double_bet(hand)
    hand.bet += @bet
    @bankroll -= @bet
    @@bankroll -= @bet
  end
  
  def win_bet(winnings)
    @bankroll += winnings
    @@bankroll+= winnings
  end
  
  def is_dealer
    if self.is_a?(Dealer)
      return 1
    end
    return nil
  end
  
  def split_hand(hand)
    if self.can_split_hand(hand)
      @num_hands += 1
      @@total_hands += 1
      i = @hand.length
      @hands[i] = hand.split
      self.place_bet(@hands[i])
      return @hands[i]
    else
      raise ArgumentError, "Hand cannot be split: #{hand.to_s}"
    end    
  end
  
  def can_split_hand(hand)
    if hand.can_split and not self.has_max_hands
      return 1
    end
    return nil
  end
  
  def can_double_bet
    return 1 unless @bankroll < @bet
    return nil
  end
  
  def can_afford_insurance
    return 1 if (@bet / 2) <= @bankroll
    return nil
  end
  
  def has_multiple_hands
    return 1 if @hands.length > 1
    return nil
  end
  
  def total_hands
    return @@total_hands
  end
end
