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
SAMPLE_SUITS = (0..3).to_a.sample
SAMPLE_DEALER_START = (0..1).to_a.sample

def prompt(string)
  puts "╰┈➤ #{string}"
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

def deal_initial_cards(current_keys, key)
  2.times do |_n|
    key = DECK[SAMPLE_SUITS].keys.sample
    current_keys << key
  end
  current_keys
end

def display_inital_cards_value(current_key, current_value)
  current_value << DECK[SAMPLE_SUITS][current_key[0]]
  current_value << DECK[SAMPLE_SUITS][current_key[1]]
  current_value
end

def deal_card(current_key, current_value)
  key = DECK[SAMPLE_SUITS].keys.sample
  current_value << DECK[SAMPLE_SUITS][key]
  current_key << key
end

def dealer_stay_logic(dealer_total)
  total_card_value(dealer_total) >= 17
end

def total_card_value(current_user)
  current_user.inject { |sum, num| sum + num }
end

def ace_value_logic!(current_user)
  if 21 - total_card_value(current_user) < 11
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
  total_card_value(player_total) > 21 ||
    total_card_value(dealer_total) > 21
end

def check_for_twenty_one(player_total, dealer_total)
  total_card_value(player_total) == 21 || total_card_value(dealer_total) == 21
end

def check_for_winner(player_total, dealer_total)
  player_total = total_card_value(player_total)
  dealer_total = total_card_value(dealer_total)
  player_total > dealer_total
end

def check_for_tie(player_total, dealer_total)
  player_total = total_card_value(player_total)
  dealer_total = total_card_value(dealer_total)
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
  if total_card_value(player_total) > 21
    prompt("Oh no! You Busted! You have lost the game")
    lose_game_symbol
    time_delay
  elsif total_card_value(dealer_total) > 21
    prompt("The Dealer has Busted! You win the game!")
    victory_symbol
    time_delay
  end
  time_delay
  system "clear"
  game_over_symbol
end

def display_twenty_one(player_total, dealer_total)
  if total_card_value(player_total) == 21
    time_delay
    twenty_one_symbol
    prompt("WOW. You have a perfect Score. Congratulations")
  elsif total_card_value(dealer_total) == 21
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
  loop do
    prompt("Welcome to 21! Please enter 'Begin' to be dealt 2 cards
    and start the game")
    start_game = gets.chomp
    break if start_game.downcase == "begin"
  end
  deal_initial_cards(player_key, sample_keys)
  deal_initial_cards(dealer_key, dealer_key)
  display_inital_cards_value(player_key, player_hand)
  display_inital_cards_value(dealer_key, dealer_hand)

  prompt("Your hand is #{player_key.join(', ')}")

  p total_card_value(player_hand)
  time_delay
  hit_or_stay = ''

  loop do
    break if hit_or_stay.downcase == 'stay' || check_for_bust(player_hand,
                                                              dealer_hand)
    prompt("Do you choose to Hit or Stay?")
    hit_or_stay = gets.chomp
    if hit_or_stay.downcase == "hit"
      ace_value_logic!(player_hand)
      deal_card(player_key, player_hand)
      prompt("This is your current hand #{player_key.join(', ')}")

    end
    if check_for_bust(player_hand, dealer_hand)
      time_delay
      display_bust_winner(player_hand, dealer_hand)
    end
  end

  if hit_or_stay == "stay" && !check_for_bust(player_hand, dealer_hand)
    prompt("You can see this from the dealer hand
          #{dealer_key[SAMPLE_DEALER_START]}")
    loop do
      ace_value_logic!(dealer_hand)
      time_delay
      break if check_for_bust(player_hand,
                              dealer_hand) || dealer_stay_logic(dealer_hand)
      if check_for_bust(player_hand, dealer_hand)
        prompt("The Dealer Has Busted!")
      else
        prompt("Dealer hits ")
      end
      time_delay

      deal_card(dealer_key, dealer_hand)
      prompt("Dealer Hand: #{dealer_key[SAMPLE_DEALER_START]}, ? ")
      time_delay
    end
  end

  if check_for_bust(player_hand, dealer_hand)
    display_bust_winner(player_hand, dealer_hand)
  end

  if !check_for_bust(player_hand,
                     dealer_hand) && !check_for_tie(player_hand, dealer_hand)
    prompt("Dealer Stays")
    prompt("Time to compare Scores!!")
    time_delay
    prompt("Your score is #{total_card_value(player_hand)} and
    the dealer's score is #{total_card_value(dealer_hand)}")
    time_delay
    if check_for_twenty_one(player_hand,
                            dealer_hand)
      display_twenty_one(player_hand,
                         dealer_hand)
    else
      display_winner(
        player_hand, dealer_hand
      )
    end
    time_delay
  end

  if !check_for_bust(player_hand,
                     dealer_hand) && check_for_tie(player_hand, dealer_hand)
    prompt("Dealer Stays")
    time_delay
    display_tie(player_hand, dealer_hand)
    prompt("Your score is #{total_card_value(player_hand)}
    and the dealer's score is #{total_card_value(dealer_hand)}")
    time_delay
  end

  prompt("▰▰▰▰▰▰▰▰▰▰▰▰Good game! Do you wish to play again? (Y/N)▰▰▰▰▰▰▰▰▰▰▰▰")

  end_game = gets.chomp
  break unless end_game.downcase.start_with?("y")
  system "clear"
end
prompt("╚══ ≪ Thank You and please play 21 again when you are up to it!' ≫ ══╝")
