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

def group_marker_count(marker)
 result =  WINNING_LINES.select do |line|
    line.select {|num|  @squares[num].marker == marker}.count == 2 &&
    line.select {|num|@squares[num].marker == ' ' }.count == 1
  end
  result
end

def need_defense?(marker)
group_marker_count(marker).any?
end

def need_offense?(marker)
group_marker_count(marker).any?
end

def make_move(marker)
moves = group_marker_count(marker)
moves.map {|arr| p arr.select {|num|  @squares[num].marker == ' '}}.flatten.sample

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

class Score
  attr_accessor :score

  def initialize
    @score = 0
  end

  def reset
    self.score = 0
  end

  def increment
    self.score += 1
  end

  def to_s
    score.to_s
  end

  def ==(other_score)
    score == other_score.score
  end
end

class TTTGame
  attr_reader :board, :human, :computer, :score, :human_score, :computer_score

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = HUMAN_MARKER
    @human_score = Score.new
    @computer_score = Score.new
  end

  def play
    clear_screen_and_display_board
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def display_board
    puts "You're a #{human.marker}. Computer is an #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    system('clear') || system('cls')
    display_board
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thank you for playing Tic Tac Toe. Goodbye!"
  end

  def display_remaining_squares
    available_squares = board.unmarked_keys
    if available_squares.size > 1
      puts "Choose from: #{available_squares.join(', ')}"
    else
      puts "Choose square #{available_squares.first}"
    end
  end

  def main_game
    loop do
      round
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def round
    loop do
      player_move
      display_result
      break if win_game?
      reset
    end
  end

  def win_game?
    if human_score.score == 2
      puts "You have won the Game! #{human_score} to #{computer_score}"
      return true
    elsif computer_score.score == 2
      puts "Your Opponent has won the game #{computer_score} to #{human_score}"
      return true
    end
    false
  end

  def reset_score
    human_score.reset
    computer_score.reset
  end

  def human_move
    display_current_scores
    puts "It's your turn to choose a move."
    display_remaining_squares

    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Invalid choice. Please choose an available square."
    end

    board[square] = human.marker
  end

  def computer_move
    if board.need_defense?(HUMAN_MARKER)
      board[board.make_move(HUMAN_MARKER)] = computer.marker
    elsif board.need_offense?(COMPUTER_MARKER)
      board[board.make_move(COMPUTER_MARKER)] = COMPUTER_MARKER
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "You have won the round!"
      human_score.increment

    when COMPUTER_MARKER
      puts "Your Opponent has won the round!"
      computer_score.increment
    else
      puts "The board is full. It's a tie!"
    end
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
      clear_screen_and_display_board
      current_player_move
      break if board.someone_won? || board.full?
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end


  def display_current_scores
    puts "Score: You #{human_score}, Opponent #{computer_score}"
    puts ""
  end

  def reset
    board.reset
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (Y/N)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Invalid choice. Please enter Y or N."
    end
    reset_score
    answer == 'y'
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
