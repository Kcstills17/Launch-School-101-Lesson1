require "pry"
require "pry-byebug"

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
user_score = [0]
cpu_score = [0]

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]] # diagonals

def prompt(string)
  puts "=> #{string}"
end

def joinor(*arr)

  if arr[1] == nil  && arr[0].size <=2
    arr.join(" or ")
  elsif arr[1] == nil && arr[0].size > 2
    string = arr.join(", ")
    prepend_or = string[-1].prepend("or ")
    string[-1] = prepend_or
    string
  elsif arr[1] != nil && arr[2] != nil
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

def computer_places_pieces!(brd)
  square = empty_board(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_board(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
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

  if detect_winner(brd) == "Player"
     player_score[0] += 1

  elsif detect_winner(brd) == "Computer"
    computer_score[0] += 1
  end
end




board = initiallize_board


loop do

  loop do



board = initiallize_board

  loop do

    display_board(board)
    prompt("User's score is #{user_score.join.to_i}, Computer's score is #{cpu_score.join.to_i}")
    player_places_piece!(board)

    break if someone_won?(board) || board_full?(board)

    computer_places_pieces!(board)
    break if someone_won?(board) || board_full?(board)

    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)

  if someone_won?(board)

    prompt("#{detect_winner(board)} Wins!")
    scoreboard(board, user_score, cpu_score)

    prompt("User's score is #{user_score.join.to_i}, computer's score is #{cpu_score.join.to_i}")

  else
    prompt("it is a tie")
    scoreboard(board, user_score, cpu_score)

    prompt("User's score is #{user_score}, computer's score is #{cpu_score}")

  end
break if user_score.join.to_i == 5 || cpu_score.join.to_i == 5
end
  prompt "#{detect_winner(board) } wins the game by a total score of #{user_score.join.to_i} to #{cpu_score.join.to_i}"
  prompt("would you like to play again? (Y/N)")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end
prompt("Thank you for playing Tic-Tac-Toe. Goodbye")


