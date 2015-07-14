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
<<<<<<< HEAD
end
puts cards
=======
  #Create Array and split string into pairs of two characters
  arr = []
  arr = str.chars.each_slice(2).map(&:join)
  puts arr[0]
  return arr
end

me = solution("AABBCC")
puts me
>>>>>>> 62cd1d6... kata training update
