=begin
P. Understand the Problem
  Explicit Requirements:
  - write a program that generates the lyrics of the 99 bottles of beer song

  Implicit Requirements:
  - Beer song has a unique verse if it's integer value is 0, 1, or 2 compared to the rest.
  - create a class named BeerSong that has one integer argument.
  - create an class method named verse
    - this method takes one integer argument and will interpolate the argument with str one time
  - create a class method verses.
    - this method will take two arguments. a starting integer and ending integer
    - from starting integer to ending integer inclusive the current verse will be interpolated.
    - if the ending_integer is 0 then the concluding str interpolation will execute.

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases

D: Data Structures
  - input: integer
  - output: str
  - possible intermediary structure: str

A: Algorithm
- create  BeerSong class
- create two class methods verse and verses
- create two private methods current_verse and final_verse

- current_verse will pass in an integer  and then inteporlate the current beer_song verse with the int. and then output that value
      - remember that if a value is 1 or 2 it will have a unique beer_song verse as opposed to the rest.

- final_verse will output the final verse of the beer_song

- in the verse method  pass in one argument
      - instantiate a BeerSong object if the argument == 0 then invoke final_verse otherwise invoke current_verse(int)

- in the verses method pass in st_int and end_int
      - iterate through a range from end_int to st_end inclusive  and initialize block variable current_num
        - if current_num != 0 then instantiate a new instance and invoke current_verse(current_num)
        - otherwise instantiate a new instance and invoke final_verse
        - join with a line break to simulate testing

  - create class method lyrics
          - method should return verses(99, 0)
C: Code with intent

=end

class BeerSong
  def self.verse(int = 0)
    int == 0 ? BeerSong.new.final_verse : BeerSong.new.current_verse(int)
  end

  def self.verses(st_int, end_int)
    (end_int..st_int).to_a.reverse.map do |current_num|
      current_num != 0 ? BeerSong.new.current_verse(current_num) : BeerSong.new.final_verse
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  def current_verse(int)
    case int
    when 1
      first_verse(int)
    when 2
      second_verse(int)
    else
      general_verse(int)
    end
  end

  def final_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  private

  def first_verse(_int)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def second_verse(int)
    "#{int} bottles of beer on the wall, #{int} bottles of beer.\n" \
    "Take one down and pass it around, #{int - 1} bottle of beer on the wall.\n"
  end

  def general_verse(int)
    "#{int} bottles of beer on the wall, #{int} bottles of beer.\n" \
    "Take one down and pass it around, #{int - 1} bottles of beer on the wall.\n"
  end
end

BeerSong.verse(99)
BeerSong.lyrics
