class CardSymbols < Hash
  def initialize
    self["A"] = 1
    2.upto(9) do |x|
        self[x.to_s] = x
    end
    self["T"] = 10
    self["J"] = 10
    self["Q"] = 10
    self["K"] = 10
  end
end

class CardSuits < Array
  def initialize
    self[0] = "D"
    self[1] = "C"
    self[2] = "H"
    self[3] = "S"
  end
end

class Card
  attr_reader :is_valid
  attr_reader :symbol, :suit, :value
  
  @@symbols = CardSymbols.new
  @@suits = CardSuits.new
  
  def initialize(symbol, suit)
    if @@symbols.key?(symbol) and @@suits.include?(suit)
      @is_valid = 1
      @symbol = symbol
      @suit = suit
      @value = @@symbols[symbol]
    else
      @is_valid = nil
    end
  end
  
  def to_s
    return "#@symbol#@suit"
  end
  
  def to_s_with_value
    value = String.new
    (2 - @value.to_s.length).times {value =+ "0"}
    value += @value.to_s
    return "#@symbol#@suit:#{value}"
  end
  
  def is_ace
    if @symbol == "A"
      return 1
    else
      return nil
    end
  end
end
