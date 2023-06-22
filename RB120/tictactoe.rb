# come up with Spike an create nouns and verbs for states and behaviors

# nouns: Players, Grid, Square
# Verbs: mark, play

require "pry"

module Clear
  def clear_game
    sleep 1
    system 'clear'
  end
end

class Board
  attr_reader :squares

  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
    [1, 5, 9], [3, 5, 7] # diagonals
  ]

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }

    reset
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
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
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
  attr_reader :marker, :name
end

class Human < Player
  attr_accessor :marker

  def initialize
    @name = name?
    @marker = nil
    super
  end

  def name?
    puts "What is your name? "
    answer = nil
    loop do
      answer = gets.chomp
      break if answer =~ /[a-z]/i
      puts "Please enter a valid name"
    end
    @name = answer.capitalize
  end

  def assign_marker
    puts "Which marker do you wish to choose? (X/0)"
    answer = nil
    loop do
      answer = gets.chomp.upcase
      break if ['X', '0'].include?(answer)
      puts "Please choose a valid mark"
    end
    @marker = answer
  end

  def to_s
    name.to_s
  end
end

class Computer < Player
  attr_reader :board

  WINNING_LINES = Board::WINNING_LINES
  NAMES = ['Naruto', 'Luffy', 'Yusuke', 'Guts', 'Thorfinn']

  def initialize(board)
    @name = NAMES.sample
    @board = board
    super()
  end

  def marker(other_marker)
    (other_marker == 'X' ? "O" : 'X')
  end

  def to_s
    name
  end

  def group_marker_count(marked, unmarked)
    WINNING_LINES.select do |line|
      # binding.pry
      line.select { |num| board.squares[num].marker == marked }.count == 2 &&
        line.select { |num| board.squares[num].marker == unmarked }.count == 1
    end
  end

  def need_action?(marked, unmarked)
    group_marker_count(marked, unmarked).any?
  end

  def make_move(marker, initial_marker)
    moves = group_marker_count(marker, initial_marker)
    moves.map do |arr|
      arr.select do |num|
        board.squares[num].marker == initial_marker
      end
    end.flatten.sample
  end

  def standard_action(marker)
    board.squares[5].marker == marker ? 5 : board.unmarked_keys.sample
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
  include Clear
  attr_reader :board, :human, :computer, :score, :human_score, :computer_score

  INITIAL_MARKER = ' '

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(board)
    @current_marker = nil
    @human_score = Score.new
    @computer_score = Score.new
  end

  def play
    introduction
    clear_screen_and_display_board
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def display_board
    human_marker = human.marker
    computer_marker = human_marker.nil? ? 'TBD' : computer.marker(human_marker)

    puts "#{human}'s mark: #{human_marker || 'TBD'}."
    puts "#{computer}'s mark: #{computer_marker}."

    puts ""
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    system "clear"
    display_board
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human}!"
    puts ""
  end

  def display_goodbye_message
    clear_game
    puts "Thank you, #{human}, for playing Tic Tac Toe. Goodbye!"
  end

  def display_remaining_squares
    available_squares = board.unmarked_keys
    if available_squares.size > 1
      puts "Choose from: #{available_squares.join(', ')}"
    else
      puts "Choose square #{available_squares.first}"
    end
  end

  def computer_marker
    computer.marker(human.marker)
  end

  def human_marker
    human.marker
  end

  def setup_markers
    human.assign_marker
    computer_marker
  end

  def win_game?
    if human_score.score == 5
      puts "#{human} has won the game! #{human_score} to #{computer_score}"
      return true
    elsif computer_score.score == 5
      puts "#{computer} has won the game! #{computer_score} to #{human_score}"
      return true
    end
    false
  end

  def reset_score
    human_score.reset
    computer_score.reset
  end

  def introduction
    clear_screen_and_display_board
    puts "Hello, #{human}! Welcome to Tic-Tac-Toe."
    puts ''
    puts "The rules: You play against an opponent, and you each have a mark."
    puts "Your goal is to have 3 consecutive marks in a row, unimpeded."
    puts "Each time you achieve this, you win a round."
    puts "Win 5 rounds, and you are the winner!"
    puts "Your opponent's name is #{computer}. Prepare for the match to begin!"
    puts "Press any key to begin the game."
    gets.chomp
  end

  def decide_first_player
    puts "Do you want to go first or defer to #{computer}? (F/S)"
    puts "F for first, S for second"
    answer = nil

    loop do
      answer = gets.chomp.downcase
      break if ['f', 's'].include?(answer)
      puts "Please provide a valid choice"
    end

    @current_marker = answer == 'f' ? human_marker : computer_marker
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

    board[square] = human_marker
  end

  def computer_move
    if need_offense?
      perform_offense
    elsif need_defense?
      perform_defense
    else
      perform_standard_move
    end
  end

  def need_offense?
    computer.need_action?(computer_marker, INITIAL_MARKER)
  end

  def perform_offense
    board[computer.make_move(computer_marker, INITIAL_MARKER)] = computer_marker
  end

  def need_defense?
    computer.need_action?(human_marker, INITIAL_MARKER)
  end

  def perform_defense
    board[computer.make_move(human_marker, INITIAL_MARKER)] = computer_marker
  end

  def perform_standard_move
    board[computer.standard_action(INITIAL_MARKER)] = computer_marker
  end

  def display_result
    clear_screen_and_display_board

    if board.winning_marker == human_marker
      human_score.increment
      puts "#{human} has won the round!"
    elsif board.winning_marker == computer_marker
      computer_score.increment
      puts "#{computer} has won the round!"
    else
      puts "The board is full. It's a tie!"
    end
  end

  def current_player_move
    if human_turn?
      human_move
      @current_marker = computer_marker
    else
      computer_move
      @current_marker = human_marker
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
    @current_marker == human_marker
  end

  def display_current_scores
    puts "Score: #{human} #{human_score}, #{computer} #{computer_score}"
    puts ""
  end

  def reset
    board.reset
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def main_game
    loop do
      round
      break unless play_again?
      reset
      display_play_again_message
      clear_game
    end
  end

  def round
    loop do
      setup_markers
      decide_first_player
      player_move
      display_result
      break if win_game?
      clear_game
      reset
    end
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
