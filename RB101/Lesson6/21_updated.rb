
spades = (2..10).to_a.zip(2..10).to_a.to_h
spades["K"] = 10
spades["Q"] = 10
spades["J"] = 10
spades["Ace"] = 11
diamonds = spades
hearts = spades
clubs = spades

DECK = [{ 'spades' => spades }, { 'diamonds' => diamonds }, { 'hearts' => hearts },
        { 'clubs' => clubs }]

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

def deal_card(current_key, current_value, sample_index, suit_key)
  sample_suit = randomize_suits(sample_index)
  suit_key = DECK[sample_suit].keys.join
  key = DECK[sample_suit][suit_key].keys.sample
  current_value << DECK[sample_suit][suit_key][key]
  suit_and_key = "#{suit_key} : #{key}"
  current_key << suit_and_key
end

def dealer_stay_logic(dealer_total)
  dealer_total >= 17
end

def total_card_value(current_user)
  current_user.reduce { |sum, num| sum + num }
end

def ace_value_logic!(current_user)
  if 11 + current_user <= 21
    DECK[0]['spades']["Ace"] = 11
    DECK[1]['diamonds']["Ace"] = 11
    DECK[2]['hearts']["Ace"] = 11
    DECK[3]['clubs']["Ace"] = 11
  else
    DECK[0]['spades']["Ace"] = 1
    DECK[1]['diamonds']["Ace"] = 1
    DECK[2]['hearts']["Ace"] = 1
    DECK[3]['clubs']["Ace"] = 1
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
  player_total > dealer_total
end

def check_for_tie(player_total, dealer_total)
  player_total == dealer_total
end

def display_winner(player_total, dealer_total)
  if check_for_winner(player_total, dealer_total)
    time_delay
    victory_symbol
    prompt("Congratulations You Have Won!")
  elsif check_for_winner(dealer_total, player_total)
    time_delay
    lose_game_symbol
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
    victory_symbol
    prompt("WOW. You have a perfect Score. Congratulations")
  elsif dealer_total == 21
    time_delay
    twenty_one_symbol
    lose_game_symbol
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

def display_endgame_results(user_sum, opp_sum)
  prompt("Dealer Stays")
  time_delay
  display_tie(user_sum, opp_sum)
  prompt("Your score is #{user_sum}
  and the dealer's score is #{opp_sum}")
  time_delay
end

def begin_game
  prompt("Welcome to 21! Please enter 'Begin' to be dealt 2 cards
  and start the game")
  start_game = gets.chomp
  start_game.downcase == "begin"
end

def play_again?
  prompt("▰▰▰▰▰▰▰▰▰▰▰▰Good game! Do you wish to play again? (Y/N)▰▰▰▰▰▰▰▰▰▰▰▰")
  end_game = gets.chomp
  end_game.downcase.start_with?("y")
end

loop do
  player_key = []
  dealer_key = []
  player_hand = []
  dealer_hand = []
  sample_suits = []
  current_suit = 0
  sample_suit_key = ''

  loop do
    break if begin_game
  end

  deal_card(player_key, player_hand, current_suit, sample_suit_key)
  deal_card(dealer_key, dealer_hand, current_suit, sample_suit_key)
  player_sum = total_card_value(player_hand)
  dealer_sum = total_card_value(dealer_hand)
  ace_value_logic!(player_sum)
  ace_value_logic!(dealer_sum)

  deal_card(player_key, player_hand, current_suit, sample_suit_key)
  deal_card(dealer_key, dealer_hand, current_suit, sample_suit_key)
  player_sum = total_card_value(player_hand)
  dealer_sum = total_card_value(dealer_hand)
  ace_value_logic!(player_sum)
  ace_value_logic!(dealer_sum)

  prompt("Your hand is #{player_key.join(', ')}")
  prompt("Your score: #{player_sum}")
  time_delay
  prompt("Dealer hand is #{dealer_key.join(', ')}")
  prompt("Dealer's score : #{dealer_sum}")

  time_delay
  hit_or_stay = ''

  loop do
    break if hit_or_stay.downcase == 'stay' || check_for_bust(player_sum,
                                                              dealer_sum)
    prompt("Do you choose to Hit or Stay?")
    hit_or_stay = gets.chomp
    if hit_or_stay.downcase == "hit"

      ace_value_logic!(player_sum)
      deal_card(player_key, player_hand, current_suit, sample_suit_key)
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

      deal_card(dealer_key, dealer_hand, current_suit, sample_suit_key)
      dealer_sum = total_card_value(dealer_hand)
      prompt(dealer_key.join(" "))
      prompt("Dealer's Score: #{dealer_sum}")
      time_delay
    end
  end

  if check_for_bust(player_sum, dealer_sum)
    display_bust_winner(player_sum, dealer_sum)
  end

  if !check_for_bust(player_sum,
                     dealer_sum) && !check_for_tie(player_sum, dealer_sum)
  display_endgame_results(player_sum, dealer_sum)
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

  end

  break unless play_again?
end
system "clear"
prompt("╚══ ≪ Thank You and please play 21 again when you are up to it!' ≫ ══╝")
