# come up with Spike an create nouns and verbs for states and behaviors

# nouns: Players, Grid, Square
# Verbs: mark, play
require "pry"

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
    reset
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ""
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |"
    puts ""
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
    # min will return string closer to A and max will return string closer to Z.
    # so if they are not the same the method will be false
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares) # => we wish this method existed
        return squares.first.marker # => return the marker, whatever it is
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def clear
    system "clear"
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
    # maybe a "status" to keep track of this square's mark?
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = '0'
  def initialize
    @board =  Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = HUMAN_MARKER
  end

  def play
    clear_screen_and_display_board
    board.draw
    loop do
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    board.clear
    board.draw
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe"
  end

  def display_goodbye_message
    puts "Thank you for playing Tic Tac toe. Please play again!"
  end

  def human_move
    puts "It is your turn to choose a move.
     Please choose from #{board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (board.unmarked_keys).include?(square)
      puts "please choose a valid box"
    end

    board[square] = human.marker
  end

  def computer_move
    board[board.unmarked_keys.to_a.sample] = computer.marker
  end

  def current_player_move
    if human_turn?
      human_move
      @current_marker = COMPUTER_MARKER
    else
      computer_move
      @current_marker = HUMAN_MARKER
    end
  end

  def player_move
    loop do
      current_player_move
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "You have won the game!"
    when COMPUTER_MARKER
      puts "Your opponent has won "
    else
      puts "The board is full."
    end
  end

  def reset
    board.reset
    board.clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "would you like to play again (Y/N)?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "please choose Y or N"
    end
    answer == 'y'
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
