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

# 3. Add a class for each individual move.
# after implementing all moves as individ. classes
# here are some thoughts
# using each move as a class I think allows for more
# natural inheritance and because of that, more natural
# polymorphism is at play.
# in the case here inheritance Is useful because there is still
# key features that all move classes should have and to avoid
# redundancy and overcoding. Also
# display_win_description, >, and < method's are all implemented
# differently within each subclass.

# was this change good? What are some cons?
# I think the use of individual classes makes the code more readable in terms of
# quickly identifying where differences in the output of each move class.
# However compared to the previous implementation where each move
# was grouped in a hash with the current value as the key
# and the moves it wins against as the values it is a much longer
# version. This could simply be due to my poor implementation.
# Overall I would say for a more in depth RPS game that each move
# having a class is a better idea so you can add more
# specificity using inheritance and polymorphism.
# In a bare bones RPS games that is not needed
# to overall have short and succint code.

# 4. Keep track of a history of moves. Will you create a class?
# I decided not to create a class as the score history is a feature of both
# Human and Computer so I decided to add an instance of score_history in
# player and pass it down through inheritance. I decided to use an
# array to then append each move from whatever the current move class
# is the current one for both players. I then created 3 methods
# one that appends to the history array, one that prints out
# the results of both the player and computer, and one that
# resets the total after a game is finished.

# 4. designate specific move pattern for each computer player
# Initial idea to create behavior class that will have
# a corresponding instance method# for each player.
# Then pass that it to the Computer player when choosing a name
# post implementation :

# initially i had some trouble setting up the Behavior class. But I quickly was
# able to figure out I wanted to pass in a name (the randomly selected argument)
# and then choose the logic of the moves based on what that name was.
# then i ran into my main issue with this which was getting the
# set_name and choose# implementation to work in tandem and
# not be two separate samples.# eventually I decided to use super
# to pass in the name attribute from player.# From there
# I could use the logic from set_name to be passed in
# as an argument# And because of this all other
# functionality elsewhere remains intact

module Clear
  def self.clear_system
    sleep 1
    system "clear"
  end
end

module Display
  include Clear

  def self.welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    Clear.clear_system
  end

  def self.explain_game
    puts "To win the game of RPSLS it is quite Simple"
    sleep 2
    puts "each move has an advantage over 2 other moves. For example"
    puts  "Rock beats Scissors and Lizard. "
    sleep 2
    puts "each move also has 2 weaknesses as well however. To win the game"
    puts "You  must beat your opponent 10 times"
    sleep 2
    Clear.clear_system
  end

  def self.introduce_opponent(human, computer)
    puts "Now #{human.name}, you will be playing against #{computer.name}."
    sleep 1.2
    puts "#{computer.name}: It is a pleasure to meet you."
    puts "I hope we have a Great match!"
    sleep 1.2
    puts "Now Let's begin the game!"
    sleep 1.2
    Clear.clear_system
  end

  def self.score(human, computer)
    puts "#{human.name}'s score is #{human.score}"
    puts "#{computer.name}'s score is #{computer.score}"
  end

  def self.format_history(history)
    history.map { |move, count| "#{move.capitalize}:#{count}" }.join(' ')
  end

  def self.score_history(human, computer)

    puts "_______________________________________________________"
    puts "#{human.name}'s move history: #{format_history(human.history)}"
    puts "#{computer.name}'s move history: #{format_history(computer.history)}"
  end

  def self.goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye"
  end

  def self.moves(human, computer)
    puts "_________________________________"
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
    puts "__________________________________"
  end

  def self.victory_description(winner_move, loser_move)
    return unless winner_move && loser_move

    puts winner_move.display_win_description(loser_move)
  end

  def self.winner(human, computer)
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
    else
      puts "Tie game!"
    end
  end

  def self.overall_winner(winner, loser)
    if winner.score > loser.score
      puts "#{winner.name} wins #{winner.score} to #{loser.score}!"
    elsif winner_score < loser_score
      puts "#{loser.name} wins #{loser.score} to #{winner.score}!"
    else
      puts "It's a tie game! #{winner.score} to #{loser.score}!"
    end

    Clear.clear_system
  end

  def self.play_again?
    answer = nil
    loop do
      puts "Would you like to play again? Y/N ?"
      answer = gets.chomp
      Clear.clear_system
      break if ['y', 'n'].include?(answer.downcase)
      puts "sorry please choose Y or N"
    end
    return true if answer.downcase == 'y'
    false
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == "scissors"
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def to_s
    value.to_s
  end
end

class Behavior
  def logic(player_name)
    case player_name
    when 'Naruto'.downcase
      then ['paper', 'scissors'].sample
    when 'Goku'.downcase
      then 'rock'
    when 'Luffy'.downcase
      then ['spock', 'lizard'].sample
    when 'Ren'.downcase
      then ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample
    end
  end
end

class Rock < Move
  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.paper? || other_move.spock?
  end

  def display_win_description(other_move)
    case other_move
    when Scissors
      "Rock crushes Scissors"
    when Lizard
      "Rock flattens Lizard"
    end
  end
end

class Paper < Move
  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def display_win_description(other_move)
    case other_move
    when Rock
      "Paper covers Rock"
    when Spock
      "Paper disproves Spock"
    end
  end
end

class Scissors < Move
  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.rock? || other_move.spock?
  end

  def display_win_description(other_move)
    case other_move
    when Paper
      "Scissors cuts Paper"
    when Lizard
      "Scissors decapitates Lizard"
    end
  end
end

class Lizard < Move
  def >(other_move)
    other_move.paper? || other_move.spock?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end

  def display_win_description(other_move)
    case other_move
    when Paper
      "Lizard eats Paper"
    when Spock
      "Lizard poisons Spock"
    end
  end
end

class Spock < Move
  def >(other_move)
    other_move.rock? || other_move.scissors?
  end

  def <(other_move)
    other_move.lizard? || other_move.paper?
  end

  def display_win_description(other_move)
    case other_move
    when Rock
      "Spock vaporizes Rock"
    when Scissors
      "Spock smashes Scissors"
    end
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = { "rock" => 0, "paper" => 0, "scissors" => 0, "lizard" => 0,
                 'spock' => 0 }
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

  def move_history
    history[move.to_s] += 1
  end

  def restore_history
    self.history = { "rock" => 0, "paper" => 0, "scissors" => 0, "lizard" => 0,
                     'spock' => 0 }
  end

  def choose_move_class(choice)
    self.move = case choice
                when 'rock'     then Rock.new(choice)
                when 'paper'    then Paper.new(choice)
                when 'scissors' then Scissors.new(choice)
                when 'lizard'   then Lizard.new(choice)
                when 'spock'    then Spock.new(choice)
                end
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
    choice = nil
    puts "please choose rock, paper scissors, lizard, or spock"
    loop do
      choice = gets.chomp
      break if  Move::VALUES.include?(choice.downcase)
      puts 'not a valid choice'
    end
    self.move = choose_move_class(choice.downcase)
  end
end

class Computer < Player
  attr_accessor :character

  def initialize
    @character = Behavior.new
    super
  end

  def set_name
    self.name = ['Naruto', 'Luffy', 'Goku', 'Ren'].sample
  end

  def choose
    choice = character.logic(name.downcase)
    self.move = choose_move_class(choice)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def score_and_score_history
    Display.score(human, computer)
    Display.score_history(human, computer)
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

  def add_score_to_player_history
    human.move_history
    computer.move_history
  end

  def restore_score_history
    human.restore_history
    computer.restore_history
  end

  def rps_and_increment_score
    increment_scores
    Display.moves(human, computer)
    Display.victory_description(human.move, computer.move)
    Display.winner(human, computer)
    Clear.clear_system
  end

  def set_game_up
    Display.welcome_message
    Display.explain_game
    Display.introduce_opponent(human, computer)
  end

  def finish_game?
    if human.score >= 10 || computer.score >= 10
      Display.overall_winner(human, computer)
      reset_score
      restore_score_history
      return true if !Display.play_again?
    end
    false
  end

  def play
    set_game_up
    loop do
      score_and_score_history
      human.choose
      computer.choose
      add_score_to_player_history
      rps_and_increment_score
      break if finish_game?
    end

    Display.goodbye_message
  end
end

RPSGame.new.play
