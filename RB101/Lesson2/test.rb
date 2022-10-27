def my_method(str)
  str << "def"
  str.object_id
  str = 'xyz'
  p str.object_id

end

a = 'abc'
my_method(a)
p a.object_id
p a



spades = (2..10).to_a.zip(2..10).to_a.to_h
spades["King"] = 10
spades["Queen"] = 10
spades["Jack"] = 10
spades["Ace"] = 11
diamonds = spades
hearts = spades
clubs = spades

DECK = [spades, diamonds, hearts, clubs]

player_total = DECK.sample.keys.sample

sample_suits = (0..3).to_a.sample

 p player_total
 p DECK[sample_suits][player_total]


