require_relative 'cards'

cards = []
symbols = CardSymbols.new
suits = CardSuits.new

i = 0 
for suit in suits
  for symbol in symbols.keys
    cards[i] = Card.new(symbol, suit)
    i += 1
  end
end
puts cards