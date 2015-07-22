requires_relative ' hand'

class DealerHand < Hand
  
  attr_accessor :hit_soft_17
  
  def initialize 
    @hit_soft_17 = nil
    super()
  end
  
  def to_s
    result = super
    result.slice!(" NICE")
    return result
  end
  
  def up_card
    return @cards[0]
  end
  
  def total
    for card in @cards
      tot += card.value
    end
    if has_ace and tot < 12
      tot2 = tot + 10
      if tot2 > 17
        return tot2
      elsif
        tot2 == 17
        unless @hit_soft_17 
          return tot2
        end
      end
    end
    return tot
  end
  
  def play(shoe)
    while can_hit and total < 17
      hit(shoe.deal_card)
    end
    stand
  end
  
  
end
