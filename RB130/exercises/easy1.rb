#1. Enumerable class creation
#Assume we have a Tree class that implements a binary tree.

class Tree
  #...
end

# A binary tree is just one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more.
# All of these collection classes include the Enumerable module, which means they have access to an each method,
# as well as many other iterative methods such as map, reduce, select, and more.

# For this exercise, modify the Tree class to support the methods of Enumerable. You do not have to actually implement any methods
# -- just show the methods that you must provide.



class Tree
  include Enumerable

  def each(arr)
   #---
  end
end

=begin

2. Optional Blocks

Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block.
 If no block is specified, the method should simply return the String 'Does not compute.'.

Examples:

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

=end


def compute(arg = nil )
block_given? ? yield(arg) :  "Does not compute"
end

p compute { 5 + 3 } == 8
p compute {"a" + "b"} == 'ab'
p compute == "Does not compute"


=begin


3. Find Missing Numbers

Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

Examples:

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []


=end

def missing(arr)
current_num = arr.min
max_num = arr.max
array = []

until current_num == max_num
  array << current_num if !arr.include?(current_num)
  current_num += 1
end
array
end
array = [2, 3, 1, 4, 5]


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

=begin


4. Divisors

Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

Examples

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


=end

def divisors(num)
  range = (1..num).to_a
  range.select {|n|  num % n  == 0 }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
#divisors(99400891) == [1, 9967, 9973, 99400891]



=begin


Encrypted Pioneers

The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field.
 The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names .

P. Understand the Problem
  Explicit Requirements:
  - we are given string that has been encrypted by the rot13 encryption logic.
  - we must decrypt it

  Implicit Requirements:
  - if a letter subtracted 13 places goes before 'a' or "A" it should start back over at the end where 'z' or 'Z' is

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
derot13('Nqn Ybirynpr") == 'Ada Lovelace

D: Data Structures
  - input: string
  - output: string
  - possible intermediary structure:


A: Algorithm
we need to subtract each str letter by 13 places. to do this we can convert each value into it's respective Aski value.
we need to be aware of where we are in our Aski chart. When a character subtracts behing the aski value for 'A' or 'a' we need to add 26 to reset the place
Once all digits have been properly moved. Convert back to str and join and return the value

C: Code with intent

=end

def derot13(str)
  decrypted_str = str.chars.map do |char|
    if char.match?(/[A-Za-z]/)
      base = char.match?(/[a-z]/) ? 'a' : 'A'
      rotated = (char.ord - 13 - base.ord) % 26 + base.ord
      rotated.chr
    else
      char
    end
  end
  decrypted_str.join
end

original_string = derot13('Nqn Ybirynpr')
puts original_string # Output: 'Ada Lovelace'

=begin

4. Iterators: True for Any?

A great way to learn about blocks is to implement some of the core ruby methods that use blocks using your own code.
 Over this exercise and the next several exercises, we will do this for a variety of different standard methods.

The Enumerable#any? method processes elements in a collection by passing each element value to a block that is provided
 in the method call. If the block returns a truthy value for any element, then #any? returns true. Otherwise, #any? returns false.
 Note in particular that #any? will stop searching the collection the first time the block returns true.

Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block.
 It should return true if the block returns true for any of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, any? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

Examples:

any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false

=end

def any?(arr)
  counter = 0

  until counter == arr.size
     arr[counter]
    return true if yield(arr[counter])
    counter += 1
  end
  return false
end

=begin
p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
=end

=begin

5. Iterators: True for All?

In the previous exercise, you developed a method called any? that is similar to the standard Enumerable#any?
 method for Arrays (our actual solution works with any Enumerable collection). In this exercise, you will develop its companion, all?.

Enumerable#all? processes elements in a collection by passing each element value to a block that is provided
in the method call. If the block returns a truthy value for every element, then #all? returns true. Otherwise,
#all? returns false. Note in particular that #all? will stop searching the collection the first time the block
 returns false.

Write a method called all? that behaves similarly for Arrays. It should take an Array as an argument, and a block.
 It should return true if the block returns true for all of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns false.

If the Array is empty, all? should return true, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

Examples:

all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true


=end


def all?(collection)
  collection.each {|num| return false if !yield(num)  }
  true
end

=begin
p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
=end


=begin

6. Iterators: True for None?

In the previous two exercises, you developed methods called any? and all? that are similar to the standard Enumerable methods with the same names.
 In this exercise, you will develop another of the methods in this family, none?.

Enumerable#none? processes elements in a collection by passing each element value to a block that is provided in the method call.
 If the block returns true for any element, then #none? returns false. Otherwise, #none? returns true. Note in particular that #none?
 will stop searching the collection the first time the block returns true.

Write a method called none? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true
if the block returns false for all of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, none? should return true, regardless of how the block is defined.

Your method may not use any of the following methods from the Array and Enumerable classes: all?, any?, none?, one?. You may, however,
 use either of the methods created in the previous two exercises.

Examples:

none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true

=end

def none?(collection )
  collection.each {|elem| return false if yield(elem) }
  true
end


 none?([1, 3, 5, 6]) { |value| p value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true




=begin


8.Iterators: True for One?

In the previous 3 exercises, you developed methods called any?, all?, and none? that are similar to the standard Enumerable methods of the same names. In this exercise, you will develop one last method from this family, one?.

Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for exactly one element, then #one? returns true. Otherwise, #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.

Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true a second time.

If the Array is empty, one? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

Examples:

one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false


=end
require 'pry'

def one?(arr)
    counter = 0
    break_value = 0
    until counter == arr.size
      break_value +=1 if yield(arr[counter])
      return false if break_value >= 2
      counter += 1
    end

    return false if break_value.zero?
  true
end

# def one?(arr)
#   count = 0

#   arr.each do |element|
#     count += 1 if yield(element)
#     return false if count > 1
#   end
#   count == 1
# end



p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false



=begin



9. Count Items

Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

Examples:

count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2


=end

def count(arr)
  #returns the count of truthy values in block
    arr.select {|value| yield(value)}.count
end


p count([1,2,3,4,5]) { |value| value.odd? } #== 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

