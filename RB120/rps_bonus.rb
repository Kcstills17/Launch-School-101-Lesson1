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
    @history = []
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
    history << move
  end

  def restore_history
    self.history = []
  end

  def choose_move_class(choice)
    case choice
    when 'rock'
      self.move = Rock.new(choice)
    when 'paper'
      self.move = Paper.new(choice)
    when 'scissors'
      self.move = Scissors.new(choice)
    when 'lizard'
      self.move = Lizard.new(choice)
    when 'spock'
      self.move = Spock.new(choice)
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
    loop do
      puts "please choose rock, paper scissors, lizard, or spock"
      choice = gets.chomp
      break if  Move::VALUES.include?(choice)
      puts 'not a valid choice'
    end
    self.move = choose_move_class(choice)
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

  def add_score_to_player_history
    human.move_history
    computer.move_history
  end

  def display_score_history
    puts "_______________________________________________________"
    puts "#{human.name}'s move history: #{human.history.join(', ')}"
    puts "#{computer.name}'s move history: #{computer.history.join(', ')}"
  end

  def restore_score_history
    human.restore_history
    computer.restore_history
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

  def display_victory_description
    return unless human.move && computer.move

    winner_move = human.move > computer.move ? human.move : computer.move
    loser_move = human.move < computer.move ? human.move : computer.move

    puts winner_move.display_win_description(loser_move)
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
    if human.score >= 10 || computer.score >= 10
      display_overall_winner
      reset_score
      restore_score_history
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
      add_score_to_player_history
      display_score_history
      increment_scores
      display_moves
      display_victory_description
      display_winner

      break if finish_game?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
