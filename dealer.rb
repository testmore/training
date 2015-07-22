require_relative 'player'

class Dealer < Player
  DEALER_NAME = "Dealer"
  DEALER_BANKROLL = 0
  
  attr_accessor :hit_soft_17
  
  def initialize
    @hit_soft_17 = nil
    super(DEALER_NAME, DEALER_BANKROLL)
  end
  
  def to_s
    if @bankroll < 0 
      bankroll = "-$#{@bankroll.abs.to_s}"
    else
      bankroll = "$#{@bankroll.abs.to_s}"
    end
    return "#{name} [#{bankroll}]"
  end
  
  def summary
    return self.to_s
  end
  
  def pay(amount)
    @bankroll -= amount
    @@bankroll -= amount
  end
  
  def start_hand
    @hands[0] = DealerHand.new
    @hands[0].hit_soft_17 = @hit_soft_17
    return @hands[0]
  end
  
  def split_hand(hand)
    return nil
  end
  
  def hand
    return [0] if self.has_a_hand
    return nil
  end
  
  
end