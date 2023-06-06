class Move
  VALUES = ['rock', 'paper', 'scissors']
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
    @value == 'scissors'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
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
      puts "please choose rock, paper, or scissors"
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
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
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

  # here is a basic outline of what the structure of the game should be

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
