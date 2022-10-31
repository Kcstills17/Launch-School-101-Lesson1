=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key
and count as 'value'. The key must be 'symbol' instead of string in Ruby
Example:
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
=end

=begin
P. Understand the Problem
  Explicit Requirements:
  - count lowercase letters in a given string
  - return the letter count with the specific letter as a key and the specific count as a value
  - key must be symbol instead of string


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
p letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})



D: Data Structures
  - input: string
  - ouput: hash with each unique letter as a key and the count as a value


A: Algorithm
  - initiallize variable letter_arr and set to the given string converted into an array
  - initiallize variable return_hash and set to a new empty hash with 0 to have an integer to be incremented.
  - iterate through letter_arr and each element.
  - convert the key to be a symbol
  - set the key of return_hash to be each element
  - set the value to equal/ increment by 1
end block
  return return_hash
C: Code with intent

=end


def letter_count(str)
  letter_arr = str.chars
  return_hash = Hash.new(0)
  letter_arr.each do |element|
    return_hash[element.to_sym] += 1
  end
  return_hash
end
p letter_count('arithmetics') ==  {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
