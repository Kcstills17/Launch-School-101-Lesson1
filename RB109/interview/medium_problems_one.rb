=begin
1. Rotation (Part 1)

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.


P. Understand the Problem
  Explicit Requirements:
  - input is an array.
  - output is a new array that moves the first element to the end of the array one time.
  - you cannot mutate the original array
  - you cannot use the method #rotate or #rotate! for this method

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  rotate_array(['a']) == ['a']

  x = [1, 2, 3, 4]
  rotate_array(x) == [2, 3, 4, 1]   # => true
  x == [1, 2, 3, 4]                 # => true


D: Data Structures
  - input: array
  - output: new array with the same elements as the original array but the first element is moved to the back
  - possible intermediary structure:


A: Algorithm
def rotate_array(arr)
  - initialized rotated_arr to the result of iterating through arr and returning its values.
  - initialize first_num to the result of removing the first element from new_arr
  append first_num to the end of new_arr
end

C: Code with intent

=end

def rotate_array(arr)
  new_arr = arr.map {|num| num}
  first_num = new_arr.shift
  new_arr << first_num

end

 x = [1, 2, 3, 4]
 rotate_array(x) == [2, 3, 4, 1]
 x == [1, 2, 3, 4]

 rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
 rotate_array(['a']) == ['a']

=begin
2. Rotation (Part 2)

Write a method that can rotate the last n digits of a number. For example:

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

P. Understand the Problem
  Explicit Requirements:
  - the first input is the a 6 digit number. The second input is a single digit number that represents the last n digits of the first input.
  - rotating one digit result in the original number
  - you may use the #rotate_array method.
  - assume n is always a positive integer.

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  rotate_rightmost_digits(735291, 1) == 735291
  rotate_rightmost_digits(735291, 2) == 735219
  rotate_rightmost_digits(735291, 3) == 735912
  rotate_rightmost_digits(735291, 4) == 732915
  rotate_rightmost_digits(735291, 5) == 752913
  rotate_rightmost_digits(735291, 6) == 352917

D: Data Structures
  - input: two integers
  - output: integer
  - possible intermediary structure: an array to use the first input converted to string and then rotate them.


A: Algorithm
def rotate_rightmost_digits(digits, rotate_digits)
  - initialize num_array to an empty array
   - convert digits to string and split by each character then append this to num_arr
   -initialize number_to_rotate to - rotate_digits
   - delete rotate_digits in num_arr
   - append  number_to_rotate to beginning of num_arr
   - use rotate_arr on num_arr
   -initialize rotated_arr and set to num_arr being joined together and then the string value converted to integers.
   - return rotated_arr
end

def rotate_num(arr)

end


C: Code with intent


=end

def rotate_rightmost_digits(digits, rotate_digits)
   num_arr = []
   num_arr = digits.to_s.chars
   number_to_rotate = num_arr[-rotate_digits]
   num_arr.delete(num_arr[-rotate_digits])
   num_arr.unshift(number_to_rotate)
  rotated_arr =  rotate_array(num_arr).join


end


 rotate_rightmost_digits(735291, 1) == 735291
 rotate_rightmost_digits(735291, 2) == 735219
 rotate_rightmost_digits(735291, 3) == 735912
 rotate_rightmost_digits(735291, 4) == 732915
 rotate_rightmost_digits(735291, 5) == 752913
 rotate_rightmost_digits(735291, 6) == 352917


=begin


3. Rotation (Part 3)

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597.
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the
original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits
method from the previous exercise.

Note that you do not have to handle multiple 0s.

  P. Understand the Problem
  Explicit Requirements:
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  max_rotation(735291) == 321579
  max_rotation(3) == 3
  max_rotation(35) == 53
  max_rotation(105) == 15 # the leading zero gets dropped
  max_rotation(8_703_529_146) == 7_321_609_845


D: Data Structures
  - input: integer
  - output: integer that represents max rotation of input
  - possible intermediary structure:


A: Algorithm
def max rotation(integer)
  initialize integer_arr to integer being converted to a string and then added to an array.
rotated_num = integer
fixed_num = 0
until  fixed num <  -integer_arr.size + 2
  set rotated_num  to the result of rotate_rightmost_digits(rotated_numbers, fixed_num  )
  fixed_num -= 1
  -end loop
  return rotated_num converted to integers
end

C: Code with intent

=end

def max_rotation(integer)
  integer_arr = integer.to_s.chars
  fixed_num = 0
   rotated_num = integer
  until fixed_num < -integer_arr.size + 2
     rotated_num = rotate_rightmost_digits(rotated_num, fixed_num)
     fixed_num -= 1

  end
   rotated_num.to_i
end
#735291, 352917, 329175, 321759, 321597,
 max_rotation(735291) == 321579
 max_rotation(3) == 3
 max_rotation(35) == 53
 max_rotation(105) == 15 # the leading zero gets dropped
 max_rotation(8_703_529_146) == 7_321_609_845


=begin
4. 1000 lights

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off.
You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches
2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and
keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.


P. Understand the Problem
  Explicit Requirements:
  - input shall be an integer that represents the number of rounds
  - output shall be an array containing integers that represents the lights on on the final round
  - on the 1st round every light is on
  -

  Implicit Requirements:
  -  on even rounds there will be three lights on and two lights off
  - on

  Clarifications/ Questions:
  - starting on the second round the 3 lights that are multiples of twos are switched.  (2, 4, 6) so now the lights still on are [1, 3, 5]
  - on the third round 3 lights that are multiples of threes are switched  (3, 6, 9) so now the lights still on are [ 1, 5]
  - on the fourth round 3 lights that are multiples of four are switched (4, 8, 12) so now the lights still on are [1, 4, 5]
  - on the fifth round 3 lights that are multiples of five are switched (5, 10, 15) so now the lights still on are [1, 4]

E: Examples/ Edge Cases
  Example with n = 5 lights:

  round 1: every light is turned on  1 and appended to lights_on
  round 2: lights 2 and 4 are now off; 1, 3, 5 are on  - 2 and check lights_on to append to lights_off
  round 3: lights 2, 3, and 4 are now off; 1 and 5 are on 3 and check lights_on to append to lights_off
  round 4: lights 2 and 3 are now off; 1, 4, and 5 are on 4 and check lights_off to append to lights_on
  round 5: lights 2, 3, and 5 are now off; 1 and 4 are on 5 and check lights_on to append to lights_off

  The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
  With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].



D: Data Structures
  - input: integer that reperesents the rounds that each separate light group will either turn on or off
  - output: an array that contains the integer values that represent what  lights are on on the final round
  - possible intermediary structure:


A: Algorithm
def  toggle_lights(number_of_lights)
  - initialize lights to light_hash(number_of_lights)
  - iterate through a range from (1..lights.size) and assign parameter determinate
    - invoke switch_value(lights, determinate)
  - end block
  - return the result of lights_that_are_on(lights)
end


def light_hash(rounds)
- initialize lights to a new hash. The keys should be each number from a range (1..rounds) each value should be set to the string 'off
- return lights
end

def lights_that_are_on(lights)
  select the lights that have a value of 'on' and then return the kes  of these lights.
end

def lights_that_are_on(lights)
    select the lights that have a value of 'off' and then return the keys  of these lights.
end

def switch_value(lights, chosen_value)
  - iterate through lights and  assign local parameters position and state
    - if lights % chosen_value == 0
    when the value of lights[position] is 'off' then switch the value to 'on' else switch the value to 'off'
end




C: Code with intent

=end

# Initialize the lights hash with all lights set to :on
def initialize_lights_hsh(int)
  hash = {}
  (1..int).each { |round| hash[round] = :on }
  hash
end

# Toggle the lights based on divisibility by round
def toggle_lights(hsh, round)
  hsh.each do |k, v|
    hsh[k] = (k % round).zero? ? (v == :on ? :off : :on) : v
  end
end

# Get the keys of the lights that are still :on
def get_on_lights(hsh)
  hsh.keys.select { |k| hsh[k] == :on }
end

# Main method to implement the lights toggling algorithm
def lights(int)
  hsh = initialize_lights_hsh(int)
  2.upto(int) { |round| toggle_lights(hsh, round) }
  get_on_lights(hsh)
end


p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]
p lights(1000)


=begin
5. Diamonds

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method.
You may assume that the argument will always be an odd integer.

P. Understand the Problem
  Explicit Requirements:
  - display a 4 pointed diamond in a n x n grid
  - input is n which is an odd integer at all times


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  diamond(3)

    *
   ***
    *

  diamond(9)

       *
      ***
     *****
    *******
   *********
    *******
     *****
      ***
      *

D: Data Structures
  - input: integer
  - output: string
  - possible intermediary structure:


A: Algorithm
def diamond(odd_num)
  - initialize line to 1
  - initialize stars to '*' * line
  - iterate through a sequence of numbers from (1..odd_num/2)
      - center stars
      - print stars
      - increment line += 2
      - stars =  "*" * line
      - print stars
    - end block
  - iterate through a sequence of numbers from (1..odd_num/2)
      - center and print stars
      - decrement line -=2
      - stars = '*' * line
      - print stars

  end
end

C: Code with intent






=end

def diamond(odd_num)
line = 1
stars = '*' * line  # make sure to use string first or the string cannot be multiplied
1.upto(odd_num/2) do |_|
   p stars.center(20)
   line += 2
   stars = '*' * line
end
1.upto(odd_num/2) do |_|
  p stars.center(20)
  line -= 2
  stars = '*' * line

end
p stars.center(20)
end

  #diamond(5)

  def diamond_two(num)
     grid =  ((1..num).to_a.select(&:odd?) + num.downto(1).to_a.select(&:odd?))
     p grid.map {|num| puts ("*" * num).center(20)}

  end


#diamond_two(9)

=begin
6. Stack Machine interpretation

A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought
of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes
the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the
result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will
transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the
  stack is transformed to 3, and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

n: Place a value n in the "register". Do not modify the stack.
PUSH: Push the register value on to the stack. Leave the value in the register.
ADD: Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB: Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT: Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV: Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD: Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP: Remove the topmost item from the stack and place in register
PRINT: Print the register value


All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.


P. Understand the Problem
  Explicit Requirements:
  - registed initialized to 0
  - all commands are passed in as string arguments

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -  stack is a dynamic array constantly either adding to it or removing from it.
  -  register is the current value being added or removed from stack. But not considered apart of the stack

E: Examples/ Edge Cases
  minilang('PRINT')
  # 0

  minilang('5 PUSH 3 MULT PRINT')
  # 15

  minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
  # 5
  # 3
  # 8

  minilang('5 PUSH POP PRINT')
  # 5

  minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
  # 5
  # 10
  # 4
  # 7

  minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
  # 6

  minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
  # 12

  minilang('-3 PUSH 5 SUB PRINT')
  # 8

  minilang('6 PUSH')
  # (nothing printed; no PRINT commands)

D: Data Structures
  - input: string representing commands to make changes to either the register, stack, or to output
  - output:  integer representing the results of each command
  - possible intermediary structure:


A: Algorithm





def run_commands(str)
  - iniitalize register to 0
  - initialize stack to an empty array
  - initialize character_array to spliting str into an array
  - initialize n to check_for_integer(str)
  - initialize number_counter to 0
  - iterate through character_array and assign parameter element
    -if  'PUSH' == element
        - append to stack the integer value of register
    -elsif "ADD" == element
        - set register to the result of adding the first element being popped off of stack to the value that register points to.
    -elsif 'SUB' == element
        -set register to the result of subtracting the first element being popped off of stack to the value that register points to.
    -elsif 'MULT' == element
        -set register to the result of multiplying the first element being popped off of stack to the value that register points to.
    -elsif "DIV" == element
        -set register to the result of dividing the first element being popped off of stack to the value that register points to.
    -elsif 'MOD' == element
        -set register to the result of the remainder of dividing the first element being popped off of the stack to the value the register points to.
    -elsif 'POP' == element
        - set register to the result of popping off the first element of the stack and placing in the register
    -elsif 'PRINT' == element
        - print register
    else register == element.to_I

    end
end

=end



def minilang(str)
  register = 0
  stack = []
  character_array = str.split
  character_array.each do |element|
     if element == 'PUSH'
      stack << register
     elsif element == 'ADD'
      register += stack.pop
     elsif element == "SUB"
      register -= stack.pop
     elsif element == 'MULT'
      register *= stack.pop
     elsif element == 'DIV'
      register /= stack.pop
     elsif element ==  'MOD'
      register %= stack.pop
     elsif element == 'POP'
      register = stack.pop
     elsif element == 'PRINT'
       puts register
     else
       register = element.to_i
     end
  end

end

#minilang('PRINT')
  # 0

  #minilang('5 PUSH 3 MULT PRINT')
  # 15

   #minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
  # 5
  # 3
  # 8

  # minilang('5 PUSH POP PRINT')
  # 5

 #  minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
  # 5
  # 10
  # 4
  # 7

   #minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
  # 6

   #minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
  # 12

   #minilang('-3 PUSH 5 SUB PRINT')
  # 8

  # minilang('6 PUSH')
  # (nothing printed; no PRINT commands)


=begin
7. Word to Digit

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five',
'six', 'seven', 'eight', 'nine' converted to a string of digits.

P. Understand the Problem
  Explicit Requirements:
  - input is a string that will be a sentence.
  - output will return the same sentence but any words that represent a number such as 'one' or 'two' will be replaced with the string digit versions of themselves e.g. '1', '2'


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

D: Data Structures
  - input: string
  - output: string with all words that represent a number converted into the string digit version
  - possible intermediary structure: a possible hash to use the original string as keys and digits of the string as values to replace them with


A: Algorithm
def word_to_digit(str)
    - initialize string_words_arr to contains words 'one'- 'ten'
    - iniitalize string_digits_arr to contains digits '1'- '10
    - initialize hsh_with_strings_and_digits with string_words_arr as the keys and string_digits_arr as the values
    - iterate through the keys of hsh_with_strings_and_digits and assign parameter word_string
      - replace and modify each word of str that is a key value from hsh_with_strings_and_digits and replace with the value from the same hash.
    - end block
    - return str
end


C: Code with intent



=end

def word_to_digit(str)
  string_words_arr = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
  string_digits_arr = ('1'..'10').to_a
  hsh_with_strings_and_digits = Hash.new
  string_words_arr.zip(string_digits_arr) {|element| hsh_with_strings_and_digits[element[0]] = element[1]}
 hsh_with_strings_and_digits.keys.each {|word_str| str.gsub!(/\b#{word_str}\b/, hsh_with_strings_and_digits[word_str])}
  str
end

   word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


=begin
8. Fibonacci sequence (Recursion)
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is
 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:


F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2
Sequences like this translate naturally as "recursive" methods. A recursive method is one in which the method calls itself. For example:

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

sum is a recursive method that computes the sum of all integers between 1 and n.

Recursive methods have three primary qualities:

They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.
In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute a new return value.

Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

P. Understand the Problem
  Explicit Requirements:
  - Write a recursive method to compute the nth fibonacci number.
  - nth is the argument

  Implicit Requirements:
  -

  Clarifications/ Questions:
  - recursive methods will always invoke the method within itself at least once
  - recursive methods must always have a condition to end recursion.
  - Recursive methods use the result returned by themselves

E: Examples/ Edge Cases
    fibonacci(1) == 1
    fibonacci(2) == 1
    fibonacci(3) == 2
    fibonacci(4) == 3
    fibonacci(5) == 5
    fibonacci(12) == 144
    fibonacci(20) == 6765

D: Data Structures
  - input: integer that represents the nth fibonacci number
  - output: integer that is a result of a recursive sequence to the  nth that will return the particular fibonacci number
  - possible intermediary structure:


A: Algorithm
  def fiboncacci(int)
    -if int is <= 2
      -then return 1
    -else
    -  add the result of invoking fibonacci(int -2) and fibonacci(int -1)
    -end if statement
  end

C: Code with intent

=end


def fibonacci(int)
  if int <= 2
    return 1
  else
    fibonacci(int - 2) + fibonacci(int -1)
  end
end


      fibonacci(1) #== 1
     fibonacci(2) #== 1
     fibonacci(3) #== 2
     fibonacci(4) #== 3
     fibonacci(5) #== 5
     fibonacci(12) #== 144
     fibonacci(20) #== 6765



    def fibonacci_tail(nth, acc1, acc2)
      if nth == 1
        acc1
      elsif nth == 2
        acc2
      else
        fibonacci_tail(nth - 1, acc2, acc2 + acc1)
      end
    end

    def fibonacci(nth)
      fibonacci_tail(nth, 1, 1)
    end


      fibonacci_tail(5, 1, 1)



=begin
9. Fibonacci (Procedural)

In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion,
some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about
fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around
fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

P. Understand the Problem
  Explicit Requirements:
  - create a fibonacci sequence without the use of recursion.
  -

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
  fibonacci(20) == 6765
  fibonacci(100) == 354224848179261915075
  fibonacci(100_001) # => 4202692702.....8285979669707537501


D: Data Structures
  - input: integer that represents the nth number of the fibonacci number
  - output: integer that is the digits at the nth fibonacci sequence
  - possible intermediary structure:


A: Algorithm
 def non_recursive_fib(num)
   - initialize current_num to 1
   - initialize previous num to 0
   - initialize between_num to currrent_num
   - initialize iterate to num - 1

    - iterate times do this
      - current_num += previous_num
      - previous_num  = between_num
      - between_num = current_num
      - end block
    - return current_num
 end

C: Code with intent



=end

def non_recursive_fib(num)
  current_num = 1
  previous_num = 0
  between_num = 1
  iterate = num - 1

  iterate.times do |n|
    current_num += previous_num
    previous_num = between_num
    between_num = current_num
    current_num
  end
  current_num
end

 non_recursive_fib(20) == 6765
 non_recursive_fib(100) == 354224848179261915075
#p non_recursive_fib(100_001)  #=> 4202692702.....8285979669707537501



=begin
10. .Fibonacci Numbers (Last Digit)

In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing
the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

P. Understand the Problem
  Explicit Requirements:
  - after getting the integer result that is the fibonacci number and return the last digit of the sequence number


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

D: Data Structures
  - input: integer
  - output: integer that is the last digit of current fib sequence.
  - possible intermediary structure:


A: Algorithm
fibo_last_digit(num)
- initialize fib_num to the result of non_recursive_fib(num) converted to string
- return the last digit of fib_num and convert back to an integer and return that digit
C: Code with intent

=end


def fibonacci_last(num)
   fib_num = non_recursive_fib(num).to_s
   fib_num[-1].to_i
end


fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
 fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
 #fibonacci_last(123456789) # -> 4  - can't compute this step even with LS solution. Either that or it is supposed to take 10 minutes to load




 # LS solution to compute big numbers such aas the last fibonacci_last example




 # bonus create a solution in which there is no delay for almost any number


 #algorithms
=begin

def fast_fibo(num)
  - initialize fibo_sequence to get_repeating_intermediate_result(num)
  - initialize index to 0
  - initialize narrowed_fibo_values to num % 60
  - initialize fibo_last_digit  to  fibo_sequence[narrowed_fibo_values - 1 ]

end


 def get_repeating_intermediate_result(num)
  - initialize last_two to an array containing 1 and 1
  - initialize last_digit_sequence to an empty array
  - from 1 to 60 iterate through fibo_values
    - set last_two to  an array containing the last digit of last_two and the result of adding the first and last digit of last_two % 10
    - append to last_digit_sequence the last_two at each iteration
    - end block

 end

=end


def get_repeating_intermediate_result
  last_two = [1,0]
  last_digit_sequence = []

  1.upto(60) do |_|
    last_two = [last_two.last, (last_two.last + last_two.first) % 10]
    last_digit_sequence << last_two[-1]
  end
   last_digit_sequence
end



def fast_fibo(num)
    fibo_sequence = get_repeating_intermediate_result
   index = 0
   narrowed_fibo_values = num % 60

   fibo_last_digit = fibo_sequence[narrowed_fibo_values - 1]

end


   p fast_fibo(123456789)


