require_relitive 'cards'

class Hand
  attr_accessor :bet, :insurance_bet
  attr_accessor :is_even_money
  attr_accessor :is_split, :is_ace_split
  
  attr_reader :cards
  
  def initialize 
    @bet = 0.00
    @insurance_bet = 0.00
    @is_even_money = nil
    @stand = nil
    @is_split = nil
    @is_ace_split = nil
    @cards = []
    
    return self
  end
  
  def to_s
    result = "[#{@cards.join("|")}]: "
    
    if is_soft
      result += total.join(" or ")
    else
      result += total.to_s
    end
    if is_bust
      result += "BUSTED"
    elsif is_bj
      result += "BLACKJACK"
    elsif total_high == 21
      result += "NICE"
    end
    
    return result

  end
  
  def is_bust
    unless total.is_a?(Array)
      return 1 if total > 21
    end
    return nil
  end
  
  def can_hit
    if total.is_a?(Array)
      return 1
    else
      return 1 if total < 21
    end
    return nil
  end
  
  def deal(cards)
    @cards = cards
  end
  
  def hit(card)
    @cards[@cards.length] = card
  end
  
  def split
    @is_split = 1
    @is_ace_split = 1 if has_ace
    hand = Hand.new
    hand.is_split = 1
    hand.is_ace_split = 1 if has_ace
    hand.hit(@cards.slice!(1))
    return hand
  end
  
  def total
    tot = 0
    for card in @cards 
      tot += card.value
    end
    
    if has_ace and tot < 12
      tot2 = tot += 10
      
      if @stand
        return tot2
      else
        return [tot, tot2]
      end
    
    else
      return tot    
    end
  end
  
  def total_high
    if is_soft
      return total[1]
    end
    return total
  end
  
  def is_soft
    if total.is_a?(Array)
      return 1
    end
    return nil
  end
  
  def is_bj
    if @cards.length == 2 and has_ace and not is_split and \
      (@cards[0].value == 10 or @cards[1].value == 10)
      return 1
    end
    return nil
  end
  
  def can_split
    if @cards.length == 2
      if @cards[0].symbol == @cards[1].symbol
        return 1
      end
    end
    return nil
  end
  
  def has_ace
    for card in @cards
      return 1 if card.is_ace
    end
    return nil
  end
  
  def has_aces
    if @cards.length == 2 and @cards[0].is_ace and @cards[1].is_ace
      return 1
    end
    return nil
  end
  
  def is_done
    return @stand
  end
  
  def stand
    @stand = 1
  end
  
end