require "pry"
require "pry-byebug"

spades = (2..10).to_a.zip(2..10).to_a.to_h
spades["K"] = 10
spades["Q"] = 10
spades["J"] = 10
spades["Ace"] = 11
diamonds = spades
hearts = spades
clubs = spades

DECK = [spades, diamonds, hearts, clubs]


def prompt(string)
  puts "╰┈➤ #{string}"
end

def randomize_suits(suit)
  suit = (0..3).to_a.sample
end

def time_delay
  sleep 1.05
end

def game_over_symbol
  prompt("
        ███▀▀▀██ ███▀▀▀███ ███▀█▄█▀███ ██▀▀▀
        ██    ██ ██     ██ ██   █   ██ ██
        ██   ▄▄▄ ██▄▄▄▄▄██ ██   ▀   ██ ██▀▀▀
        ██    ██ ██     ██ ██       ██ ██
        ███▄▄▄██ ██     ██ ██       ██ ██▄▄▄
        ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼
        ███▀▀▀███ ▀███  ██▀ ██▀▀▀ ██▀▀▀▀██▄
        ██     ██   ██  ██  ██    ██     ██
        ██     ██   ██  ██  ██▀▀▀ ██▄▄▄▄▄▀▀
        ██     ██   ██  █▀  ██    ██     ██
        ███▄▄▄███    ▀█▀    ██▄▄▄ ██     ██▄")
end

def victory_symbol
  prompt('__  __     ______     __  __        __     __     __     __   __
    /\ \_\ \   /\  __ \   /\ \/\ \      /\ \  _ \ \   /\ \   /\ "-.\ \
    \ \____ \  \ \ \/\ \  \ \ \_\ \     \ \ \/ ".\ \  \ \ \  \ \ \-.  \
     \/\_____\  \ \_____\  \ \_____\     \ \__/".~\_\  \ \_\  \ \_\\"\_\
      \/_____/   \/_____/   \/_____/      \/_/   \/_/   \/_/   \/_/ \/_/
                                                                         ')
end

def lose_game_symbol
  prompt("
    _|      _|                        _|
      _|  _|    _|_|    _|    _|      _|          _|_|      _|_|_|    _|_|
        _|    _|    _|  _|    _|      _|        _|    _|  _|_|      _|_|_|_|
        _|    _|    _|  _|    _|      _|        _|    _|      _|_|  _|
        _|      _|_|      _|_|_|      _|_|_|_|    _|_|    _|_|_|      _|_|_|
                                                                              ")
end

def tie_symbol
  prompt(" .------..------..------..
    |T.--. ||I.--. ||E.--. ||!.--. |
    | :/\: || (\/) || (\/) || (\/) |
    | (__) || :\/: || :\/: || :\/: |
    | '--'T|| '--'I|| '--'E|| '--'!|
    `------'`------'`------'`------'
                           ")
end

def twenty_one_symbol
  system "clear"
  prompt(" .########..########.########..########.########..######..########.....######...######...#######..########..########.####
  .##.....##.##.......##.....##.##.......##.......##....##....##.......##....##.##....##.##.....##.##.....##.##.......####
  .##.....##.##.......##.....##.##.......##.......##..........##.......##.......##.......##.....##.##.....##.##.......####
  .########..######...########..######...######...##..........##........######..##.......##.....##.########..######....##.
  .##........##.......##...##...##.......##.......##..........##.............##.##.......##.....##.##...##...##...........
  .##........##.......##....##..##.......##.......##....##....##.......##....##.##....##.##.....##.##....##..##.......####
  .##........########.##.....##.##.......########..######.....##........######...######...#######..##.....##.########.####")
end

def deal_initial_cards(current_keys, key, sample_index)
  sample_suit = randomize_suits(sample_index)
  2.times do |_n|
    key = DECK[sample_suit].keys.sample
    current_keys << key
  end
end

def display_inital_cards_value(current_key, current_value, suits)
  current_value << DECK[suits][current_key[0]]
  current_value << DECK[suits][current_key[1]]

end

def deal_card(current_key, current_value, sample_index)
  sample_suit = randomize_suits(sample_index)
  key = DECK[sample_suit].keys.sample
  current_value << DECK[sample_index][key]
  current_key << key
end

def dealer_stay_logic(dealer_total)
  dealer_total >= 17
end

def total_card_value(current_user)
  current_user.reduce { |sum, num| sum + num }
end

def ace_value_logic!(current_user)
  if 21 - current_user < 11
    DECK[0]["Ace"] = 1
    DECK[1]["Ace"] = 1
    DECK[2]["Ace"] = 1
    DECK[3]["Ace"] = 1
  else
    DECK[0]["Ace"] = 11
    DECK[1]["Ace"] = 11
    DECK[2]["Ace"] = 11
    DECK[3]["Ace"] = 11
  end
end

def check_for_bust(player_total, dealer_total)
  player_total > 21 ||
    dealer_total > 21
end

def check_for_twenty_one(player_total, dealer_total)
  player_total == 21 || dealer_total == 21
end

def check_for_winner(player_total, dealer_total)
  player_total > dealer_total || player_total < dealer_total
end

def check_for_tie(player_total, dealer_total)
  player_total == dealer_total
end

def display_winner(player_total, dealer_total)
  if check_for_winner(player_total, dealer_total)
    time_delay
    victory_symbol
    prompt("Congratulations You Have Won!")
  elsif lose_game_symbol
    time_delay
    prompt("You Have lost the game. Better Luck next time")
  end
end

def display_bust_winner(player_total, dealer_total)
  if player_total > 21
    prompt("Oh no! You Busted! You have lost the game")
    lose_game_symbol
    time_delay
  elsif dealer_total > 21
    prompt("The Dealer has Busted! You win the game!")
    victory_symbol
    time_delay
  end
  time_delay
  system "clear"
  game_over_symbol
end

def display_twenty_one(player_total, dealer_total)
  if player_total == 21
    time_delay
    twenty_one_symbol
    prompt("WOW. You have a perfect Score. Congratulations")
  elsif dealer_total == 21
    time_delay
    twenty_one_symbol
    prompt("The Dealer has a perfect score. Impressive")

  end
end

def display_tie(player_total, dealer_total)
  if check_for_tie(player_total, dealer_total)
    time_delay
    tie_symbol
    prompt("Wow. There is a tie!")
  end
end

loop do
  player_key = []
  dealer_key = []
  player_hand = []
  dealer_hand = []
  sample_keys = []
  sample_suits = []
  current_suit = 0

  loop do

    suit = DECK[randomize_suits(sample_suits)]

    prompt("Welcome to 21! Please enter 'Begin' to be dealt 2 cards
    and start the game")
    start_game = gets.chomp
    break if start_game.downcase == "begin"
  end
  deal_initial_cards(player_key, sample_keys, sample_suits)
  deal_initial_cards(dealer_key, sample_keys, sample_suits)
  display_inital_cards_value(player_key, player_hand, current_suit)
  display_inital_cards_value(dealer_key, dealer_hand, current_suit)
  player_sum = total_card_value(player_hand)
  dealer_sum = total_card_value(dealer_hand)
  prompt("Your hand is #{player_key.join(', ')}")
  prompt("Your score: #{player_sum}")
  time_delay
  hit_or_stay = ''

  loop do
    break if hit_or_stay.downcase == 'stay' || check_for_bust(player_sum,
                                                              dealer_sum)
    prompt("Do you choose to Hit or Stay?")
    hit_or_stay = gets.chomp
    if hit_or_stay.downcase == "hit"

      ace_value_logic!(player_sum)
      deal_card(player_key, player_hand, current_suit)
      player_sum = total_card_value(player_hand)
      prompt("This is your current hand #{player_key.join(', ')}")
      prompt("Your score: #{player_sum}")


    end
    if check_for_bust(player_sum, dealer_sum)
      time_delay
      display_bust_winner(player_sum, dealer_sum)
    end
  end

  if hit_or_stay == "stay" && !check_for_bust(player_sum, dealer_sum)
    prompt("You can see this from the dealer hand
          #{deal_initial_cards(dealer_key ,sample_keys, current_suit)}")
    loop do
      ace_value_logic!(dealer_sum)
      time_delay
      break if check_for_bust(player_sum,
                              dealer_sum) || dealer_stay_logic(dealer_sum)
      if check_for_bust(player_sum, dealer_sum)
        prompt("The Dealer Has Busted!")
      else
        prompt("Dealer hits ")
      end
      time_delay

      deal_card(dealer_key, dealer_hand, current_suit)
      dealer_sum = total_card_value(dealer_hand)
      prompt("Dealer Hand: #{deal_initial_cards(dealer_key ,sample_keys, current_suit)}, ? ")
      time_delay
    end
  end

  if check_for_bust(player_sum, dealer_sum)
    display_bust_winner(player_sum, dealer_sum)
  end

  if !check_for_bust(player_sum,
                     dealer_sum) && !check_for_tie(player_sum, dealer_sum)
    prompt("Dealer Stays")
    prompt("Time to compare Scores!!")
    time_delay
    prompt("Your score is #{player_sum} and
    the dealer's score is #{dealer_sum}")
    time_delay
    if check_for_twenty_one(player_sum,
                            dealer_sum)
      display_twenty_one(player_sum,
                         dealer_sum)
    else
      display_winner(
        player_sum, dealer_sum
      )
    end
    time_delay
  end

  if !check_for_bust(player_sum,
                     dealer_sum) && check_for_tie(player_sum, dealer_sum)
    prompt("Dealer Stays")
    time_delay
    display_tie(player_sum, dealer_sum)
    prompt("Your score is #{player_sum}
    and the dealer's score is #{dealer_sum}")
    time_delay
  end

  prompt("▰▰▰▰▰▰▰▰▰▰▰▰Good game! Do you wish to play again? (Y/N)▰▰▰▰▰▰▰▰▰▰▰▰")

  end_game = gets.chomp
  break unless end_game.downcase.start_with?("y")
  system "clear"
end
prompt("╚══ ≪ Thank You and please play 21 again when you are up to it!' ≫ ══╝")
