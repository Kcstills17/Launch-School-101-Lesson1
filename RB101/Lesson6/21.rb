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

def time_delay
  sleep 1.05
end
# rubocop:disable Metrics/AbcSize
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
  prompt("   ::::::::::: ::::::::::: :::::::::: :::
     :+:         :+:     :+:        :+:
    +:+         +:+     +:+        +:+
   +#+         +#+     +#++:++#   +#+
  +#+         +#+     +#+        +#+
 #+#         #+#     #+#
###     ########### ########## ###       ")
end

def twenty_one_symbol
  prompt(" .########..########.########..########.########..######..########.....######...######...#######..########..########.####
  .##.....##.##.......##.....##.##.......##.......##....##....##.......##....##.##....##.##.....##.##.....##.##.......####
  .##.....##.##.......##.....##.##.......##.......##..........##.......##.......##.......##.....##.##.....##.##.......####
  .########..######...########..######...######...##..........##........######..##.......##.....##.########..######....##.
  .##........##.......##...##...##.......##.......##..........##.............##.##.......##.....##.##...##...##...........
  .##........##.......##....##..##.......##.......##....##....##.......##....##.##....##.##.....##.##....##..##.......####
  .##........########.##.....##.##.......########..######.....##........######...######...#######..##.....##.########.####")
end
# rubocop:enable Metrics/AbcSize
def deal_initial_cards(player_total, dealer_total)
  2.times do |_n|
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
  total_card_value(dealer_total) >= 17
end

def total_card_value(current_user)
  current_user.reduce { |current_sum, num| current_sum += num }
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
  total_card_value(player_total) > 21 || total_card_value(dealer_total) > 21
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
  player_hand = []
  dealer_hand = []
  loop do
    prompt("Welcome to 21! Please enter 'Begin' to be dealt 2 cards
    and start the game")
    start_game = gets.chomp
    break if start_game.downcase == "begin"
  end
  deal_initial_cards(player_hand, dealer_hand)
  prompt("Your hand is #{player_hand.join(', ')}")
  time_delay
  hit_or_stay = ''

  loop do
    break if hit_or_stay.downcase == 'stay' || check_for_bust(player_hand,
                                                              dealer_hand)
    prompt("Do you choose to Hit or Stay?")
    hit_or_stay = gets.chomp
    if hit_or_stay.downcase == "hit"
      ace_value_logic!(player_hand)
      deal_player_card(player_hand)
      prompt("This is your current hand #{player_hand.join(', ')}")
    end
    if check_for_bust(player_hand, dealer_hand)
      time_delay

      time_delay
    end
  end

  if hit_or_stay == "stay" && !check_for_bust(player_hand, dealer_hand)

    loop do
      ace_value_logic!(dealer_hand)
      break if check_for_bust(player_hand,
                              dealer_hand) || dealer_stay_logic(dealer_hand)
      if check_for_bust(player_hand,
                        dealer_hand)
        prompt("The Dealer Has Busted!")
      else
        prompt("Dealer hits ")
      end
      time_delay
      deal_dealer_card(dealer_hand)
      prompt("Dealer Hand: #{dealer_hand.join(' ')}")
      time_delay
    end
  end

  if check_for_bust(player_hand, dealer_hand)
    p display_bust_winner(player_hand, dealer_hand)
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

  prompt("Good game! Do you wish to play again? (Y/N)")

  end_game = gets.chomp
  break unless end_game.downcase.start_with?("y")
  system "clear"
end
