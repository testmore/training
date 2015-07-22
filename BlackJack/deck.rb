require_relative 'cards'

class Deck
  
  def initialize
    @cards = []
    symbols = CardSymbols.new
    suits = CardSuits.new
    i = 0
    
    for suit in suits
      for symbol in symbols.keys
        @cards[i] = Card.new(symbol, suit)
        i += 1
      end
    end
    return self
  end
  
  def to_s
    pad = 2
    cpl = (80 / (pad + 4))
    
    if @cards.length > 99
      pad = 3
      cpl = (80 / (pad + 4))
    end
    
    result = String.new
    0.upto(@cards.length - 1) do |x|
     (pad - (x + 1).to_s.length).times { result += "0" }
    # (pad - (x + 1).to_s.length).times { result += "0" }
      result += (x + 1).to_s
      result += ":"
      result += @cards[x].to_s
      result += " "
      result += "\n" if ( (x + 1) % cpl) == 0 and x + 1 != @cards.length
    end
    return result
  end
  
  def shuffle
    @cards.replace @cards.sort_by { rand }
  end
  
  def cut(cut_at)
    if cut_at.is_a?(Integer) and cut_at > 0 and cut_at < @cards.length
      arr = @cards.slice!(cut_at, @cards.length - cut_at)
      @cards.replace(arr + @cards)
    else
      raise ArgumentError, "cut must between [1..#{@cards.length - 1}"
    end
  end
end

