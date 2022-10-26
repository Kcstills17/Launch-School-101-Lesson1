# game of 21

# General Pedac

=begin
P. Understand the Problem
  Explicit Requirements:
  - game must have a user and a dealer.
  - both the user and the dealer choose cards
  - Initially both the player and dealer are randomly dealt 2 cards
  - the player and dealer select cards(hit) until either one of them reaches 21
    or busts(card value becomes greater than 21)
  - there are 4 sets of cards Diamonds, Aces, Spades, and Hearts
    each consist of 13 values 2-10 and King, Jack, Queem and Ace
  - Ace can represent either 1 or 11 depending if 11 would cause
    the current user to bust or not
  -  the dealer must hit until the value is 17 or greater then
    the dealer should stay (Not draw a card that turn)
  - if the player or dealer has drawn more than one ace and the value
    would be greater than 21 if all are 11 than some of the ace's must
    one to fit the requirements
  - When the player stays it is the dealer's turn. And vice versa. Continue play
    until one has either reached 21 or busted.
  - if both users stay than both scores should be compared to see who has
    the higher total
    end


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -

D: Data Structures
  - possible: Hash for the different sets of cards


A: Algorithm
  High Level general Algorithm for game
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

C: Code with intent


=end
require "pry"
require "pry-byebug"
spades = (2..10).to_a.zip(2..10).to_a.to_h
spades["King"] = 10
spades["Queen"] = 10
spades["Jack"] = 10
spades["Ace"] = 11
diamonds = spades
hearts = spades
clubs = spades

DECK = [spades, diamonds, hearts, clubs]

player_hand = []
dealer_hand = []

def prompt(string)
  puts "╰┈➤ #{string}"
end

def deal_initial_cards(player_total, dealer_total)
2.times do |n|
  dealer_total << DECK.sample.values.sample
  player_total << DECK.sample.values.sample
end
player_total
end

def deal_player_card(player_total)
  player_total << DECK.sample.values.sample
end

def deal_dealer_card(dealer_total)
  dealer_total << DECK.sample.values.sample
end

def dealer_stay_logic(dealer_total)
  total_card_value(dealer_total) >= 17 ?  true : false
end

def total_card_value(current_user)
current_user.reduce {|current_sum, num|  current_sum += num}
end

def ace_value_logic!(current_user)
  if 21 - total_card_value(current_user) < 11
    DECK[0]["Ace"] = 1
    DECK[1]["Ace"] = 1
    DECK[2]["Ace"] = 1
    DECK[3]["Ace"] = 1
  end
end

def check_for_bust(player_total, dealer_total)
 total_card_value(player_total) > 21 || total_card_value(dealer_total) > 21
end

def display_bust_winner(player_total, dealer_total)
  case check_for_bust(player_total, dealer_total)
  when total_card_value(player_total) > 21
    prompt("You've lost the game. Better luck next time")
  when total_card_value(dealer_total) > 21
    prompt("You have won the game! Congratulations")
  end
  total_card_value(player_total) > 21 ? total_card_value(player_total) : total_card_value(dealer_total)
end

def check_for_21(player_total, dealer_total)
  if total_card_value(player_total) == 21
    prompt("You have a perfect score of 21! You Win!")
  elsif total_card_value(dealer_total) == 21
    prompt("The Dealer has a perfect score of 21! You lose")
  end
end

def check_for_winner(player_total, dealer_total)
  player_total = total_card_value(player_total)
  dealer_total = total_card_value(dealer_total)
  player_total > dealer_total ? prompt("You have won the game! Congrats!") : prompt("The Dealer has won. Better luck next time")

end

def check_for_tie(player_total, dealer_total)
  player_total = total_card_value(player_total)
  dealer_total = total_card_value(dealer_total)
player_total == dealer_total
end

def display_tie(player_total, dealer_total)
  if check_for_tie(player_total, dealer_total)
    prompt("Wow. There is a tie!")
  end
end

loop do
loop do
prompt("Welcome to 21! Please enter 'Begin' to be dealt 2 cards and start the game")
start_game = gets.chomp
break if start_game.downcase == "begin"
end
 deal_initial_cards(player_hand, dealer_hand)
prompt("Your hand is #{player_hand.join(", ")}")
hit_or_stay = ''

loop do

  break if hit_or_stay.downcase == 'stay' || check_for_bust(player_hand, dealer_hand)
  prompt("Do you choose to Hit or Stay?")
  hit_or_stay = gets.chomp
  if hit_or_stay.downcase == "hit"
    ace_value_logic!(player_hand)
    deal_player_card(player_hand)
    prompt("This is your current hand #{player_hand.join(", ")}")
  end
  if check_for_bust(player_hand, dealer_hand)
    prompt("Oh no! You have busted")
  end
end

if hit_or_stay == "stay" && !check_for_bust(player_hand, dealer_hand)

  loop do
    ace_value_logic!(dealer_hand)
    break if check_for_bust(player_hand, dealer_hand) || dealer_stay_logic(dealer_hand)
    check_for_bust(player_hand, dealer_hand) ? prompt("The Dealer Has Busted!") : prompt("Dealer hits ")
    p deal_dealer_card(dealer_hand)
  end
end

if check_for_bust(player_hand, dealer_hand)
  p display_bust_winner(player_hand, dealer_hand)
end

if !check_for_bust(player_hand, dealer_hand) && !check_for_tie(player_hand, dealer_hand)
  prompt("Dealer Stays")
  prompt("Time to compare Scores!!")
  prompt("Your score is #{total_card_value(player_hand)} and the dealer's score is #{total_card_value(dealer_hand)}")
  check_for_21(player_hand, dealer_hand) ? check_for_21(player_hand, dealer_hand) : check_for_winner(player_hand, dealer_hand)
end

if  !check_for_bust(player_hand, dealer_hand) && check_for_tie(player_hand, dealer_hand)
  prompt("Dealer Stays")
  display_tie(player_hand, dealer_hand)
  prompt("Your score is #{total_card_value(player_hand)} and the dealer's score is #{total_card_value(dealer_hand)}")
end


prompt("Good game! Do you wish to play again or call it a day? (Y/N)")
end_game = gets.chomp
break unless end_game.downcase.start_with?("y")
end


