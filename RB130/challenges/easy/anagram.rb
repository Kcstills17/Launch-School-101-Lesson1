=begin
P. Understand the Problem
  Explicit Requirements:
  - We have an Anagram class that passes in one string argument

  Implicit Requirements:
  - we are to compare if our passed in string value has the same value as the result of the `match` method
  - this method is to check an array of passed in values. if any value can be rearranged to match the same passed in str
  - add that to a return arr.
  - if there are no matching values return an empty array.
  - case insensitivity
  - only unique values

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: str
  - output: arr
  - possible intermediary structure: arr


A: Algorithm
- create anagram class with str argument as an instance variable
- create an anagram_arr instance variable and set to an empty array.
- create a method that will sort the passed in str value
- create a method that will check to see if the sorted str is equal to the downcased and sorted version of each element of  anagram_arr  and check to see that the str passed in
- downcased is not equal to any element. If both these are true then append these values to the anagram_arr
- take the anagram_arr in a new method and select only unique values.

C: Code with intent







=end

require 'pry'
class Anagram
  attr_reader :str, :sorted
  attr_accessor :anagram_arr

  def initialize(str)
    @str = str
    @anagram_arr = []
    @sorted = sort_str(@str.downcase)
  end

  def match(arr)
  add_anagram(arr).uniq
  end



 # private
  def sort_str(str)
    str.chars.sort.join
  end


 #protected
def add_anagram(arr)
 arr.each {|elem|sorted == elem.downcase.chars.sort.join && elem.downcase != str ? anagram_arr << elem : anagram_arr }
 anagram_arr
end

end

corn = Anagram.new('Orchestra')

p corn.add_anagram %w(cashregister Carthorse radishes)
