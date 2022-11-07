require 'pry'
require 'pry-byebug'
SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
score = { "Player" => 0, 'Dealer' => 0 }
GAME_DETERMINE_VALUE = 31
DEALER_STAY_VALUE = GAME_DETERMINE_VALUE - 4

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > GAME_DETERMINE_VALUE
  end

  sum
end

def busted?(cards)
  total(cards) > GAME_DETERMINE_VALUE
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(player_sum, dealer_sum)
  if player_sum > GAME_DETERMINE_VALUE
    :player_busted
  elsif dealer_sum > GAME_DETERMINE_VALUE
    :dealer_busted
  elsif dealer_sum < player_sum
    :player
  elsif dealer_sum > player_sum
    :dealer
  else
    :tie
  end
end

def score_game(user_total, opp_total, result)
  logic = detect_result(user_total, opp_total)

  case logic
  when :player_busted
    result["Dealer"] += 1
  when :dealer_busted
    result["Player"] += 1
  when :player
    result["Player"] += 1
  when :dealer
    result["Dealer"] += 1
  when :tie
    result
  end
end

def display_score(user_total, opp_total, result)
  logic = detect_result(user_total, opp_total)

  case logic
  when :player_busted || :dealer_busted || :player || :dealer || :tie
    prompt("Player Score: #{result['Player']}
   Dealer Score: #{result['Dealer']}")
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_compare_scores(user_cards, opp_cards, user_total, opp_total)
  puts "============================"
  prompt "Player has #{user_cards}, for a total of: #{user_total}"
  prompt "Dealer has #{opp_cards}, for a total of: #{opp_total}"

  puts "==="
end

def total_rounds_game_winner(game_score)
  game_score["Player"] == 5 || game_score["Dealer"] == 5
end

def display_total_rounds_game_winner(game_score)
  puts "============================"
  game_score["Player"] == 5 || game_score["Dealer"] == 5
  if game_score["Player"] == 5
    prompt("Player has won by a score of #{game_score['Player']} to
   #{game_score['Dealer']}. Congrats!")
  elsif game_score["Dealer"] == 5
    prompt("Player has lost the game #{game_score['Player']} to
   #{game_score['Dealer']}. Better luck next time")
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  (if score["Player"] == 0 && score['Dealer'] == 0
     (prompt "Welcome to Twenty-One!")
   else
     (prompt("next round"))
   end)
  puts "============================"

  if total_rounds_game_winner(score)
    display_total_rounds_game_winner(score)
    score = { "Player" => 0, 'Dealer' => 0 }
    break unless play_again?
  end

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and
   #{player_cards[1]}, for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    score_game(player_total, dealer_total, score)
    display_compare_scores(player_cards, dealer_cards, player_total,
                           dealer_total)
    display_result(player_total, dealer_total)
    display_score(player_total, dealer_total, score)
    if display_total_rounds_game_winner(score)
      play_again? ? next : break
    end
    next
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= DEALER_STAY_VALUE

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    score_game(player_total, dealer_total, score)
    display_compare_scores(player_cards, dealer_cards, player_total,
                           dealer_total)
    display_result(player_total, dealer_total)
    display_score(player_total, dealer_total, score)

    if display_total_rounds_game_winner(score)
      play_again? ? next : break
    end
    next
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  score_game(player_total, dealer_total, score)
  display_compare_scores(player_cards, dealer_cards, player_total, dealer_total)
  display_result(player_total, dealer_total)
  display_score(player_total, dealer_total, score)
end

prompt "Thank you for playing Twenty-One! Good bye!"

# bonus question 2. The key difference with
# the first 2 play_again? invocations is that they are apart
# of a ternary operator. if play_again is true then we skip the remaining code
# and start over at the beginning, else we break from the current loop.
# the final play_again? is invocated at the final loop of the game
# and if it is true the game will continue looping.
