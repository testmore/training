

cardsHearts = ['AH', "KH", "QH", "JH", "0H", "9H", "8H", "7H", "6H", "5H", "4H", "3H", "2H"].freeze
cardsDimonds = ['AD', "KD", "QD", "JD", "0D", "9D", "8D", "7D", "6D", "5D", "4D", "3D", "2D"].freeze
cardsClubs = ['AC', "KC", "QC", "JC", "0C", "9C", "8C", "7C", "6C", "5C", "4C", "3C", "2C"].freeze
cardsSpades = ['AS', "KS", "QS", "JS", "0S", "9S", "8S", "7S", "6S", "5S", "4S", "3S", "2S"].freeze

fullDeck = []
fullDeck = cardsHearts + cardsDimonds + cardsClubs + cardsSpades

#puts fullDeck
#puts "-------------"
fullDeck.shuffle!
#puts fullDeck
Player = []
Dealer = []

Player << fullDeck[0]
Dealer << fullDeck[1]
Player << fullDeck[2]
Dealer << fullDeck[3]
puts "-------"
puts Player
puts "---Vs.---"
puts Dealer