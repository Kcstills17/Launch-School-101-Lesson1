#Consider the following class:
require 'pry'
class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def switch_status
   puts  "the state is #{switch}"
  end

   private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end

end

#Modify this class so both flip_switch and the setter method switch= are private methods.

Machine
test = Machine.new
 #test.stop
 #test.switch_status



#2. Fixed Array
#A fixed-length array is an array that always has a fixed number of elements.
# Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:
class FixedArray
  attr_accessor :array
  attr_reader :size
  def initialize(size)
    @size = size
    @array = Array.new(size)
  end

  def to_a
    array.clone
  end

  def [](index)
    #raise IndexError, 'Index out of bounds' if index < 0 || index >= @size

    array.fetch(index) #this is how we check if the index is out of bounds of what we want.
  end

  def []=(index, value)
    #raise IndexError, 'Index out of bounds' if index < 0 || index >= @size
    self[index] #using our [](index) method to first check if the index is out of bounds
    array[index] = value
  end

  def to_s
    to_a.to_s
  end
end
fixed_array = FixedArray.new(5)
=begin
#puts  fixed_array
puts fixed_array[3] == nil
#puts fixed_array
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
#puts fixed_array
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'
=end
=begin
begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin

  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true

end
=end
#The above code should output true 16 times.


# 3. Students

#Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods
# in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:
# Graduate students have the option to use on-campus parking, while Undergraduate students do not.
# Graduate and Undergraduate students both have a name and year associated with them.
# Note, you can do this by adding or altering no more than 5 lines of code.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end


 student = Undergraduate.new('stan', 22)
 graduate = Graduate.new('zane', 2023, 'west side')




#4.Circular Queue
# A circular queue is a collection of objects stored in a buffer that is treated as though it is
# connected end-to-end in a circle. When an object is added to this circular queue, it is added
# to the position that immediately follows the most recently added object, while removing an object
# always removes the object that has been in the queue the longest.

# This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object
# to the queue requires getting rid of an existing object; with a circular queue, the object that has been in
# the queue the longest is discarded and replaced by the new object.

#Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:
=begin
P1 	P2 	P3 	Comments
			All positions are initially empty
1 			Add 1 to the queue
1 	2 		Add 2 to the queue
	2 		Remove oldest item from the queue (1)
	2 	3 	Add 3 to the queue
4 	2 	3 	Add 4 to the queue, queue is now full
4 		3 	Remove oldest item from the queue (2)
4 	5 	3 	Add 5 to the queue, queue is full again
4 	5 	6 	Add 6 to the queue, replaces oldest element (3)
7 	5 	6 	Add 7 to the queue, replaces oldest element (4)
7 		6 	Remove oldest item from the queue (5)
7 			Remove oldest item from the queue (6)
			Remove oldest item from the queue (7)
			Remove non-existent item from the queue (nil)
=end
#Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects.
# The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

    #enqueue to add an object to the queue
    #dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.

#You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

#Examples:
class CircularQueue
  attr_accessor :next_position, :oldest_position
  attr_reader :list
  def initialize(size)
    @list = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless list[next_position].nil?
      self.oldest_position = increment(next_position)
    end

    list[next_position] = object
    self.next_position = increment(next_position)
  end

  def dequeue
    value = list[oldest_position]
    list[oldest_position] = nil
    self.oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % list.size
  end

  def to_s
    "#{list}"
  end
end

=begin
queue = CircularQueue.new(3)
puts queue.dequeue == nil


puts queue.enqueue(1)
puts queue
queue.enqueue(2)
puts queue
p queue.dequeue #== 1
puts queue.oldest_position
puts queue
queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2
puts queue.oldest_position

queue.enqueue(5)
puts queue.oldest_position
queue.enqueue(6)
puts queue.oldest_position
queue.enqueue(7)
puts queue.oldest_position
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

#The above code should display true 15 times.

=end

#5. Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

    #n Place a value n in the "register". Do not modify the stack.
    #PUSH Push the register value on to the stack. Leave the value in the register.
    #ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    #SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    #MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    #DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    #MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    #POP Remove the topmost item from the stack and place in register
    #PRINT Print the register value

#All operations are integer operations (which is only important with DIV and MOD).

#Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error
#if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty).
# In all error cases, no further processing should be performed on the program.

#You should initialize the register to 0.
class MiniLangError < StandardError; end
class BadTokenError < MiniLangError; end
class EmptyStackError < MiniLangError; end

class Minilang
  attr_accessor :register, :stack
  attr_reader :str

  COMMANDS = {
    "PUSH" => :push,
    "ADD" => :add,
    "SUB" => :sub,
    "MULT" => :mult,
    "DIV" => :div,
    "MOD" => :mod,
    "POP" => :pop,
    "PRINT" => :print
  }

  def initialize(str)
    @register = 0
    @str = str
    @stack = []
  end

  def eval
    split_words.each do |elem|
      if n(elem)
        add_to_register(elem)
      elsif COMMANDS.key?(elem)
        send(COMMANDS[elem])
      else
        raise BadTokenError, "Invalid token: #{elem}"
        return
      end
    end

  rescue BadTokenError => e
    puts e.message
  rescue EmptyStackError => e
    puts e.message
  end
  private

  def split_words
    str.split
  end

  def n(e)
    e.to_i.to_s == e
  end

  def print
    puts "#{register}"
  end

  def add_to_register(num)
    self.register = num.to_i
  end

  def push
    stack << register
  end

  def pop
    raise EmptyStackError, "Empty Stack!" if stack.empty?
    self.register = stack.pop
  end

  def add
    self.register += stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def handle_exception(token)
    puts "Invalid token: #{token}"
  end
end

#Minilang.new('PRINT').eval
# 0

#Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

#Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

#Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5


#Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

#Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

#Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

#Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

#Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

#Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

#6. Number Guesser Part 1

#Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

class GuessingGame
  attr_reader :correct_number
  attr_accessor :guess_amount, :current_guess

  def initialize
    @guess_amount = 7
    @correct_number = randomized_number
    @current_guess =  nil
  end

  def play
    loop do
      display_remaining_guesses
      determine_guess
      break if result?
    end
  end

  private

  def display_remaining_guesses
    puts "You have #{guess_amount} guesses remaining"
  end

  def randomized_number
    (1..100).to_a.sample
  end

  def choose_number
    answer = nil
    puts "Enter a number between 1 and 100"
    loop do
      answer = gets.chomp
      break if (1..100).to_a.include?(answer.to_i)
      puts "Invalid input. Please enter a number between 1 and 100."
    end
    self.current_guess = answer.to_i
  end


  def determine_guess
    choose_number
    if current_guess > correct_number
      puts ''
      puts "Your guess is too high"
      puts ''
      self.guess_amount -= 1
    elsif current_guess < correct_number
      puts ''
      puts "your guess is too low"
      puts ''
      self.guess_amount -= 1
    else
      puts "That's the number"
    end
  end

  def correct?
    current_guess == correct_number
  end

  def out_of_guesses?
    self.guess_amount == 0
  end

  def result?
    if correct?
      puts "you won!"
      true
    elsif out_of_guesses?
      puts "You have no more guesses. You've Lost!"
      true
    end
  end

end

game = GuessingGame.new



#game.play
=begin


7. Number Guesser Part 2

In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game.
You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:
Math.log2(size_of_range).to_i + 1

Note that a game object should start a new game with a new number to guess with each call to #play.

=end

class GuessingGame
  attr_reader :correct_number
  attr_accessor :guess_amount, :current_guess, :low_end, :high_end

  def initialize(low_end, high_end)
    @low_end = low_end
    @high_end = high_end
    @guess_amount = guess_logic
    @correct_number = between_range
    @current_guess =  nil
  end

  def play
    loop do
      display_remaining_guesses
      determine_guess
      break if result?
    end
  end

  private

  def display_remaining_guesses
    puts "You have #{guess_amount} guesses remaining"
  end

  def between_range
    (low_end..high_end).to_a.sample
  end

  def guess_logic
    Math.log2(high_end - low_end).to_i + 1
  end

  def choose_number
    answer = nil
    puts "Enter a number between #{low_end} and #{high_end}"
    loop do
      answer = gets.chomp
      break if (self.low_end..self.high_end).to_a.include?(answer.to_i)
      puts "Invalid input. Please enter a number between #{low_end} and #{high_end}"
    end
    self.current_guess = answer.to_i
  end


  def determine_guess
    choose_number
    if current_guess > correct_number
      puts ''
      puts "Your guess is too high"
      puts ''
      self.guess_amount -= 1
    elsif current_guess < correct_number
      puts ''
      puts "your guess is too low"
      puts ''
      self.guess_amount -= 1
    else
      puts "That's the number"
    end
  end

  def correct?
    current_guess == correct_number
  end

  def out_of_guesses?
    self.guess_amount == 0
  end

  def result?
    if correct?
      puts "you won!"
      true
    elsif out_of_guesses?
      puts "You have no more guesses. You've Lost!"
      true
    end
  end

end

#game = GuessingGame.new(500, 1000 )


#game.play


=begin

8.
Highest and Lowest Ranking Cards

Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects:

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

For this exercise, numeric cards are low cards, ordered from 2 through 10. Jacks are higher than 10s, Queens are higher than Jacks, Kings
are higher than Queens, and Aces are higher than Kings. The suit plays no part in the relative ranking of cards.

If you have two or more cards of the same rank in your list, your min and max methods should return one of the matching cards;
it doesn't matter which one.

Besides any methods needed to determine the lowest and highest cards, create a #to_s method that returns a String representation of the card,
e.g., "Jack of Diamonds", "4 of Clubs", etc.
=end

class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end


  #def <=>(other_card)
  #  convert_rank_to_int(rank) <=> convert_rank_to_int(other_card.rank)
  #end

  def convert_rank_to_int(rank)

    case rank
    when 'Jack'
     return  11
    when 'Queen'
      return 12
    when 'King'
     return  13
    when 'Ace'
     return  14
    end
    rank.to_i
  end

  def to_s
    "#{rank} of #{suit}"
  end
end
=begin
cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
=end

=begin

Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards.
Use the following code to start your work:

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end

The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and,
if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.

Note that the last line should almost always be true; if you shuffle the deck 1000 times a second,
you will be very, very, very old before you see two consecutive shuffles produce the same results.
If you get a false result, you almost certainly have something wrong.

=end


class Deck

  include Comparable
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    reset
  end

  def draw
    reset if cards.empty?
   cards.shift
  end

  private
  attr_accessor :cards

  def reset
    SUITS.each do |suit|
      RANKS.each do |rank|
       cards << Card.new(rank, suit)
      end
      end
      cards.shuffle!
  end

end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
 p  drawn.count {|card|  card.rank == 5 } == 4
 p drawn.count {|card|  card.suit == "Hearts" } == 13



drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.


