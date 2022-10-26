require "pry"
require "pry-byebug"
INITIAL_MARKER = ' '
PLAYER_MARKER = 'Ⓧ'
COMPUTER_MARKER = 'Ⓞ'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]] # diagonals

def prompt(string)
  puts "╰┈➤ #{string}"
end

# need logic to shorten this for rubo
def joinor(*arr)
  if arr[0].size <= 2
    arr.join(" or ")
  elsif  arr[0].size > 2
    string = arr.join(", ")
    prepend_or = string[-1].prepend("or ")
    string[-1] = prepend_or
    string
  elsif !arr[2].nil?
    string = arr[0].join(arr[-2])
    prepend_input = string[-1].prepend("#{arr[-1]} ")
    string[-1] = prepend_input
    string
  else
    string = arr[0].join(arr[-1])
    prepend_or = string[-1].prepend("or ")
    string[-1] = prepend_or
    string
  end
end

# rubocop:disable Metrics/abcSize
def display_board(brd)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  prompt("Player is #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}")
end

# rubocop:enable Metrics/abcSize
def initiallize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_board(brd)
  brd.keys.select do |num|
    brd[num] == ' '
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("choose  a square #{joinor(empty_board(brd))}:")
    square = gets.chomp.to_i
    break if empty_board(brd).include?(square)
    prompt("this is not a valid input. please try again")
  end
  brd[square] = PLAYER_MARKER
end

# I had a difficult time with this initially
def computer_logic(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  elsif board.values_at(*line).count(marker) != 2
    board.select { |k, v| k == 5 && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = computer_logic(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = computer_logic(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    p square = empty_board(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_board(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd) # accesses value of each hash pair with use of splat
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def scoreboard(brd, player_score, computer_score)
  case detect_winner(brd)
  when "Player"
    player_score[0] += 1

  when "Computer"
    computer_score[0] += 1
  end
end

def display_score(user, cpu, brd)
  prompt("User Score : #{user.join.to_i} Computer Score : #{cpu.join.to_i}")
    scoreboard(brd, user, cpu)

end

def announce_win_or_tie(user, cpu, brd)
initial_user = user.join.to_i
initial_cpu = cpu.join.to_i
if user.join.to_i > initial_user  || user.join.to_i > initial_cpu
  prompt("#{detect_winner(brd)} is the winner!")
elsif cpu.join.to_i > initial_user || cpu.join.to_i > initial_user
  prompt("#{detect_winner(brd)} is the winner!")
else
  prompt("There is a tie!")
end
end

def cpu_game_order_choice(brd)
  [player_places_piece!(brd), computer_places_piece!(brd)].sample
end

def place_piece!(brd, current_player)
  if current_player == PLAYER_MARKER
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  (current_player == PLAYER_MARKER ? COMPUTER_MARKER : PLAYER_MARKER)
end

game_order = ''
user_score = nil
cpu_score = nil
board = nil
loop do
  user_score = [0]
  cpu_score = [0]

  loop do

    prompt("would you like to go first or second in the game?
      (First/Second) or allow the computer to decide who goes first? (CPU)")
    game_order = gets.chomp
    break if game_order == "first".downcase || game_order == "second".downcase
  end
  board = initiallize_board
  loop do

    board = initiallize_board

    current_player = game_order == 'first' ? PLAYER_MARKER : COMPUTER_MARKER

    loop do
      display_board(board)
      display_score(user_score, cpu_score, board)

      place_piece!(board, current_player)

      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
    announce_win_or_tie(user_score, cpu_score, board)
    display_score(user_score, cpu_score, board)
    display_board(board)


    break if user_score.join.to_i == 5 || cpu_score.join.to_i == 5
  end

  system "clear"
  prompt "#{detect_winner(board)} wins the game by a total score of
   #{user_score.join.to_i} to #{cpu_score.join.to_i}"
  prompt("would you like to play again? (Y/N)")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end
prompt(" (￣ε￣〃)ｂ Thank you for playing Tic-Tac-Toe. Goodbye  ʘ‿ʘ) ╯✧･ﾟ: *✧･ﾟ:*")
# I wanted to insert the ending part into a method.
# but i ran into issues involving the loops that made things
# break
=begin


def place_piece(board, current_player)
    current_player == PLAYER_MARKER ?
    player_places_piece : computer_places_piece
  end

  def alternate_player(current_player)
    current_player = (current_player == PLAYER_MARKER ?
      COMPUTER_MARKER : PLAYER_MARKER)
  end

  loop do
    board = initiallize_board
    current_player = game_order == 'first' ? PLAYER_MARKER : COMPUTER_MARKER

    loop do
      display_board(board)
      who_won_or_is_tie(user_score, cpu_score, board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    who_won_or_is_tie(user_score, cpu_score, board)
    break if user_score.join.to_i == 5 || cpu_score.join.to_i == 5
  end

  system "clear"
    prompt "#{detect_winner(board)} wins the game by a total score of
     #{user_score.join.to_i} to #{cpu_score.join.to_i}"
    prompt("would you like to play again? (Y/N)")
    play_again = gets.chomp
    break unless play_again.downcase.start_with?('y')
  end
  prompt(" (￣ε￣〃)ｂ Thank you for playing Tic-Tac-Toe.
  Goodbye  ʘ‿ʘ) ╯ ✧･ﾟ: *✧･ﾟ:*")


  # TIC TAC TOE

  # BEGIN GAME
  # DO THE MAIN LOOP
    # CHOOSE PLAYER
    # PLAY A GAME LOOP
      #
       #
        #


=end
