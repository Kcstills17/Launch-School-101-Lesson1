# 1. add a score. Either as a class
# or as a state of an existing class
# Classes: Move, Player, Human, Computer
# score could  be a state of player
# a Player has a score
# Score could also be a class that Human
# or Computer call in RPSgame to compare scores
# set score instance in both Human and Computer classes
# change loop structure so that display_goodbye_message
# only shows after Human or Computer score is >= 10

# 2. add Spock and Lizard
# rock > scissors, lizard
# paper > rock, spock
# scissors > paper, lizard
# lizard > paper, spock
# spock > scissors, rock
class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  # due to the operator complexity it was best to
  # replace the methods for each move and long
  # >/< methods with using a hash here
  WINNING_COMBINATIONS = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['paper', 'spock'],
    'spock' => ['rock', 'scissors']
  }

  attr_reader :value

  def initialize(value)
    @value = value
    # now we only need to initialize value and not set it manually
    # to moves
  end

  def >(other_move)
    WINNING_COMBINATIONS[value].include?(other_move.value)
    # we have our value of the hash (the human move)
    # we then see if the computer move is included
    # if so > is true and can be used as a greater
    # operator
  end

  def <(other_move)
    WINNING_COMBINATIONS[other_move.value].include?(value)
    # same situation but now it is true and can be
    # used as a less than operator
  end

  def to_s
    value.to_s
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def increment_score
    self.score += 1
  end

  def reset
    self.score = 0
  end

  def >(other_score)
    self.score > other_score
  end
end

class Human < Player
  def set_name
    player_name = ''
    loop do
      puts "What's your name? "
      player_name = gets.chomp
      break unless player_name.empty?
    end
    self.name = player_name.capitalize
  end

  def choose
    choice = nil?
    loop do
      puts "please choose rock, paper scissors, lizard, or spock"
      choice = gets.chomp
      break if  Move::VALUES.include?(choice)
      puts 'not a valid choice'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Naruto', 'Luffy', "Light", 'Yusuke', 'Ren', 'Gohan'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

=begin
class Move
  def initialize
    # we can choose out of our three options RPS.
    # keep track of turns possibly?
  end

end

class Rules
def initialize
  # decide how many times we want to play to win
  #other  states undetermined

end
end
=end

# def compare - unsure how  to use compare as of now

# now we need an orchestration method to actually play the game.
# Something like RPSGame

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_score
    puts "#{human.name}'s score is #{human.score}"
    puts "#{computer.name}'s score is #{computer.score}"
  end

  def reset_score
    human.reset
    computer.reset
  end

  def increment_scores
    if human.move > computer.move
      human.increment_score
    elsif human.move < computer.move
      computer.increment_score
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye"
  end

  def display_moves
    puts "_________________________________"
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
    puts "__________________________________"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
    else
      puts "Tie game!"
    end
  end

  def display_overall_winner
    winner = human.score > computer.score ? human : computer
    loser = human.score > computer.score ? computer : human

    winner_name = winner.name
    winner_score = winner.score
    loser_score = loser.score

    puts "#{winner_name} is the winner by
    the score of #{winner_score} to #{loser_score}!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? Y/N ?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "sorry please choose Y or N"
      puts '____________________________'
    end
    return true if answer.downcase == 'y'
    false
  end

  def finish_game?
    if human.score >= 2 || computer.score >= 2
      display_overall_winner
      reset_score
      return true if !play_again?
    end
    false
  end

  # here is a basic outline of what the
  # structure of the game should be

  def play
    display_welcome_message
    loop do
      display_score
      human.choose
      computer.choose
      increment_scores
      display_moves
      display_winner
      break if finish_game?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
