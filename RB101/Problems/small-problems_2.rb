# Solving Problems with PEDAC- Part 2

=begin

1. Build a program that randomly generates and prints Teddy's age.
  To get the age,you should generate a random number between 20 and 200.

P. Understand the Problem
  Explicit Requirements:
  - goal is to randomly generate Teddy's age
  - age is received by picking randmoly between the numbers 20 and 200
  -

  Implicit Requirements:
  - none

  Clarifications/ Questions:
  -none

E: Examples/ Edge Cases
 - Teddy is 69 years old!

D: Data Structures
  - input: none given
  - output: string interpolated with integer Teddy's age

A: Algorithm
   create variable teddy_age
    - set teddy_age to select randomly between 20-200
    - insert teddy_age into the string Teddy is (--) years old!
   end

=end
# C: Code with intent

def age
  teddy_age = rand(20..200)
  p "Teddy is #{teddy_age} years old!"
end

p age

=begin

2. How big is the room?
Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

P. Understand the Problem
  Explicit Requirements:
  - Asks the user for an input
  - The input is the length and width of the room in meters
  - output displays the area of the room in square meters and square feet

  Implicit Requirements:
  - There is two different instances of the user being asked for an input
  - ask for the length first and then the width
  - length of the output in square feet is rounded to 2 decimal places

  Clarifications/ Questions:
  - none

E: Examples/ Edge Cases
 - Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

D: Data Structures
  - output displays string interpolation with string and then the converted integer
  -

A: Algorithm
   create method area_and_sqft
    - Print What is the length of the room in meters
    - set variable length_meters equal to user response converted to an integer
    - Print what is the width of the room in meters
    - set variable width_meters to user response converted to an integer
    - set variable area_meters equal to length_meters times width_meters with both meter lengths converted to floats
    - set variable area_sqft equal to area_meters times 10.7639
    - interpolate string  the area of the room is area_meters (area_sqft square feet) and round the decimal place to 2
   end
=end
# C: Code with intent
def area_and_sqft
  puts "what is the length of the room in meters?"
  length_meters = gets.chomp.to_i
  puts "what is the width of the room in meters?"
  width_meters = gets.chomp.to_i
  area_meters = length_meters.to_f * width_meters.to_f
  area_sqft = area_meters * 10.7639
  p "the area of the room is #{area_meters} (#{area_sqft.round(2)} in square feet )"
end

# area_and_sqft

# bonus question to convert feet into square feet, square inches and square centimeters
def feet_conversion
  puts "=> what is the length of the room in feet"
  length_feet = gets.chomp.to_i

  puts "=> what is the width of the room in feet"
  width_feet = gets.chomp.to_i

  feetlength_to_sqft = length_feet.to_i * length_feet.to_i
  feetwidth_to_sqft = width_feet.to_i * width_feet.to_i
  feet_area = length_feet * width_feet
  sqft_area = feetlength_to_sqft * feetwidth_to_sqft

  sqinch_area = sqft_area * 144
  sqcm_area = (sqinch_area * 6.4516).to_f.round(2)
  p "=> the area of the room in feet is #{feet_area} (#{sqft_area} in square feet, #{sqinch_area} in square inches, #{sqcm_area} in square centimeters)"
end

# feet_conversion

=begin

3. Tip Calculator
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.
The program must compute the tip and then display both the tip and the total amount of the bill.

P. Understand the Problem
  Explicit Requirements:
  - ask user for a bill amount and a tip rate
  - compute the tip and display the total amount of the bill

  Implicit Requirements:
  - must prompt for the user 2 separate times
  - must convert the tip percentage as an amount based on the base bill amount

  Clarifications/ Questions:
  -none

E: Examples/ Edge Cases
 - What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

D: Data Structures
  -  output is interpolated string

A: Algorithm
  create method tip_rate()
    - print what is your bill amount?
    - store amount in variable bill converted to an integer

    - print what is your tip rate?
    - store in variable tip converted to an integer

    - multiply tip by .01. name result of product tip_percentage
    -multiply tip_percentage by bill , add to bill amount,  convert total to float, and round to tenth place. name result final_total
    - interpolate final_total with the string the total is (--)
    - bonus: include in string interpolation the decimal place being formatted to the 100th place
  end
=end
# C: Code with intent

def tip_rate
  puts "=> what is your bill amount?"
  bill = gets.chomp.to_i

  puts "=> what is your tip rate?"
  tip = gets.chomp.to_i

  tip_percentage = (tip * 0.01)
  final_total = format("%0.2f", tip_percentage * bill + bill).to_s
  p "=> the total is $#{(final_total)}"
end
# tip_rate

=begin

4. When will I retire?
Build a program that displays when the user will retire and how many years she has to work till retirement.

P. Understand the Problem
  Explicit Requirements:
  -  display when the user will retire
  - display how many years they will have to work before retirement

  Implicit Requirements:
  - prompt the user for their age
  - prompt the user when they will have to retire
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

D: Data Structures
  - output is string interpolated

A: Algorithm
    create method retire_when?()
    - print what is the user's age?
    - initiallize variable age and set to the user's response converted to an integer

    -  print when would the user like to retire
    -  Initiallize variable retire_at and set to user's response converted to an integer

    -  initiallize variable time_left and set to retire_at - age
    -  intiallize variable current_year which will be equal to accessing what year is today
    -  Initiallize variable year_retire to equal current_year + time_left

    -  interpolate string "It's (--) You will retire in (--)"
    -  interpolate string "You have only (--) years of work to go "
     end

C: Code with intent

=end

def retire_when?
  puts "=> what is your age? "
  age = gets.chomp.to_i

  puts "=> When would you like to retire?"
  retire_at = gets.chomp.to_i

  time_left = retire_at - age
  current_year = Time.new.year
  year_retire = current_year + time_left

  p "=> It's #{current_year} you will retire in #{year_retire}"
  p "=> You have only #{time_left} years of work to go "
end

# retire_when?

=begin

5. Greeting a user
Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

P. Understand the Problem

  Explicit Requirements:
  - program asks for the user's name
  - afterwards greet the user
  - if the user writes 'name!' have the computer yell back at the user

  Implicit Requirements:
  -  reply with also "WHY ARE WE SCREAMING" if the initial response is "hello!"

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -What is your name? Bob
Hello Bob.

-What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

D: Data Structures
  - output is string

A: Algorithm
 create method what_is_name?()
  - print what is your name?
  - initiallize variable user_name and set to response

  - if user_name includes ! as it's last character
    - print HELLO (user_name(uppercased)) . WHY ARE WE SCREAMING?
  - else
    - print Hello (user_name)
    end if statement
 end

C: Code with intent

=end

def what_is_name?
  puts "=> What is your name?"
  user_name = gets.chomp

  if user_name[-1].include?("!")
    puts "=> HELLO (#{user_name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "=> Hello #{user_name}."
  end
end

# what_is_name?()

# Launch School solution
# print 'What is your name? '
# name = gets.chomp

# if name[-1] == '!'
#  name = name.chop
#  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#  puts "Hello #{name}."
# end

=begin

6. Odd numbers

Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

P. Understand the Problem
  Explicit Requirements:
  - print all odd numbers from 1-99 inclusive
  - make sure each number is on a separate line

  Implicit Requirements:
  - remove even numbers

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -

D: Data Structures
  - output are integers

A: Algorithm
   create method display_odd()
    - create counter and set to 0

    - until counter is >= 100
      - initallize variable numbers which will be set to include numbers 1-99
      - if number at specific counter  is odd, print. if number is even, remove
      - increment counter by 1
    -exit loop
   end

C: Code with intent

=end

def display_odd
  counter = 0
  until counter >= 100
    numbers = (1..99).to_a
    numbers[counter].odd? ? (p numbers[counter]) : false
    counter += 1
  end
end

# display_odd

=begin

#7. Even Numbers
Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

P. Understand the Problem
  Explicit Requirements:
  - print all even numbers from 1 to 99 includisve
  - print each on a separate line

  Implicit Requirements:
  - remove all odd numbers

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -

D: Data Structures
  - returns integers

A: Algorithm
  Create method display_even()
    - create an array called numbers including numbers 1-99

    - iterate through array and select even number
      - print number if number is even
    -end block
 end

C: Code with intent

=end

def display_even
  numbers = (1..99).to_a

  numbers.select do |number|
    p number if number.odd?
  end
end

# display_even

=begin

8. Sum or Product of Consecutive Integers
Write a program that asks the user to enter an integer greater than 0, then asks if the
user wants to determine the sum or product of all numbers between 1 and the entered integer.

P. Understand the Problem
  Explicit Requirements:
  - first prompt the user for an integer greater than 0
  - after, determine if the user wants the sum or the product  of all numbers between 1 and the entered integer
  -

  Implicit Requirements:
  - Must determine how to find the sum and product of the number
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -  >> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.

- >> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

D: Data Structures
  - output is interpolated string with integers

A: Algorithm
Core-Method:
display_sum_or_product()
- initiallize variable input_sum and set to 0
- initiallize variable input_product and set to 0

- create outer loop
   - Initiallize variable user_num and set to ''

  - create loop for first validation
    - print "please enter an ineger greater than 0 "
    - initiallize variable user_number to that answer
    -break out of inner loop if number_valid?(user_number)
  -end first validation loop

  - create loop for second validation
    - print " Enter 's' to compute the sum, 'p' to compute the product."
    - initiallize variable sum_or_product to that answer
    - when sum_or_product is equal to 's'
      - set input_sum to sum_of_number(user_num)
      - print "the sum of integers between 1 and (user_num) is (input_sum)"
    - when sum_or_product is equal to 'p'
      - set input_product to product_of_number(user_num)
      - print "the prodicts of integers between 1 and (user_num) is (input_product)"
    -else
    - print "please enter 's' or 'p' "
  - end if statmenet
  - break out of loop if sum_or_product includes either 's' or 'p'
  - end second validation loop

 - puts "would you like to try another number? Y/N"
 - initiallize variable run_again to the previous print
 - break unless run_again starts with "Y" case insensitive
 end

  Sub-Method:
   sum_of_number(number)
    - create variable total  and set to 0
    - create counter and set to number
    - while counter >=  0
      - total plus equals counter
      - decrement counter by 1
    - end while loop
    - total
    end

Sub-Method:
  product_of_number(number)
    - create variable total and set to 1
    - create counter and set equal to number

    - while counter greater >= to  1
      - total times equals counter
      - decrement counter by 1
    - end while loop
    - total
  end

  Sub-Method:
  number_valid?(input_string)
  - Unless input_string == 0
    - the number converted to a string and then back into an integer should equal the original number
  - end loop
end

C: Code with intent

=end

def sum_of_number(number)
  total = 0
  counter = number

  while counter >= 0
    total += counter
    counter -= 1
  end
  total
end

def product_of_number(number)
  total = 1
  counter = number

  while counter >= 1
    total *= counter
    counter -= 1
  end
  total
end

def number_valid?(input_string)
  unless input_string == 0
    input_string.to_s.to_i == input_string
  end
end

def display_sum_or_method
  input_sum = 0
  input_product = 0

  loop do
    user_num = ''

    loop do
      puts "=> please enter an integer greater than 0"
      user_num = gets.chomp.to_i
      break if  number_valid?(user_num)
    end

    loop do
      puts "=>  Enter 's' to compute the sum, 'p' to compute the product."
      sum_or_product = gets.chomp
      case sum_or_product
      when 's'
        input_sum = sum_of_number(user_num)
        puts "<< The sum of integers 1 to #{user_num} is #{input_sum}"
      when 'p'
        input_product = product_of_number(user_num)
        puts "<< The sum of integers 1 to #{user_num} is #{input_product}"
      else
        puts "<< Please enter either 's' or 'p' for a valid return "
      end

      break if %w[s p].include?(sum_or_product)
    end

    puts "Would you like to try again?"
    run_again = gets.chomp
    break unless run_again.downcase.start_with?('y')
  end
end

# display_sum_or_method

=begin
9. String Assignment

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

What does this code print out? Think about it for a moment before continuing.

If you said that code printed

Alice
Bob

you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

What does this print out? Can you explain these results?

Going in order of what is occuring
 - Name is set to string "Bob"
 - save_name is set to name. Meaning that save_name and name are pointing to the same address in memory. This is an example of pass by value
 - name.upcase! This is a mutating method. Therefore the value both variables are pointing to have been changed . This is an example of pass by reference
 - puts name, save_ name should be
 => BOB
    BOB
 - As the value was mutated that both name and save_name pointed to.

=end

=begin
10. Mutation
What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

in order of what is occuring
- array1 is set to ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groupo', 'Zeppo]
- array2 is set to an empty array []
- array1 with the each method will append to array2 each value of array1
- array1 with the second each method uses a mutation method that upcases each value that begins with 'C' and 'S"
- puts array2
- What is occuring is that array2 is being appended the values of array1 however, it is returning the same array and not a new one
- Therefore when array1 is mutated with the Upcase method array2 should have the same result
-puts array2 should output
- => Moe
     Larry
     CURLY
     SHEMP
     Harpo
     CHICO
     Groupo
     Zeppo

=end




