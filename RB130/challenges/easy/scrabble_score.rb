=begin

Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:
Letter 	Value
A, E, I, O, U, L, N, R, S, T 	1
D, G 	2
B, C, M, P 	3
F, H, V, W, Y 	4
K 	5
J, X 	8
Q, Z 	10

How to Score

Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

    3 points for C
    1 point for each A (there are two)
    3 points for B (there are two)
    2 points for G
    1 point for E

Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

P. Understand the Problem
  Explicit Requirements:
  - we are to create a Scrabble class that will pass in a str value
  -

  Implicit Requirements:
  - a data structure will be needed to match each case insensitive letter to a value that is defined in the example.  A hash which has the keys
    1. 2. 3, 4, 5, and 8 and then the corresponding values shall be an array of each value that matches it's key.

    - a value passed in as nil or if no value is passed in nil will be equal to 0
    - Must account for a class method `score` that will be the same as the instance method

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases

D: Data Structures
  - input: str
  - output: integer
  - possible intermediary structure: hash

A: Algorithm
- create Scrabble class and pass in str and set this as an instance variable @str
- initialize instance variable @scrabble_score and set to 0
- create a constant SCRABBLE_HASH and set each key as the respective integer key from the above chart.
- Set each value as an array containing each corresponding str for the key.
- create a private method that will upcase each character from @str and break up by each char. name this split_arr
- create a method that will access split_arr and iterate through the arr. for each element access the key that matches the current hash value
- if the value is nil then set the current value to 0
- add this value to @scrabble_score and save this value
- return @scrabble_score
-

C: Code with intent
=end

require 'pry'

class Scrabble
  attr_accessor :scrabble_score
  attr_reader :str

  def initialize(str = 0)
    @str = str
    @scrabble_score = 0
  end

  SCRABBLE_HASH = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }

  def score
    return when_nil_or_empty if when_nil_or_empty

    matching_score = split_arr.map do |current_num|
      SCRABBLE_HASH.map { |score, chars| score if chars.include?(current_num) }.compact
    end

    self.scrabble_score = matching_score.flatten.sum
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  private

  def split_arr
    str.upcase.chars
  end

  def when_nil_or_empty
    0 if str.nil? || str.empty?
  end
end

