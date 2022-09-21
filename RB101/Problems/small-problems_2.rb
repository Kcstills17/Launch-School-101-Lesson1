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
  - create variable teddy_age
  - set teddy_age to select randomly between 20-200
  - insert teddy_age into the string Teddy is (--) years old!

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
  - create method area_and_sqft
    - Print What is the length of the room in meters
    - set variable length_meters equal to user response converted to an integer
    - Print what is the width of the room in meters
    - set variable width_meters to user response converted to an integer
    - set variable area_meters equal to length_meters times width_meters with both meter lengths converted to floats
    - set variable area_sqft equal to area_meters times 10.7639
    - interpolate string  the area of the room is area_meters (area_sqft square feet) and round the decimal place to 2
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
=end
# C: Code with intent

def tip_rate
  puts "=> what is your bill amount?"
  bill = gets.chomp.to_i

  puts "=> what is your tip rate?"
  tip = gets.chomp.to_i

  tip_percentage = (tip * 0.01)
  final_total = "#{format("%0.2f", tip_percentage * bill + bill)}"
  p "=> the total is $#{( final_total)}"
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
   - create method retire_when?()
   -  print what is the user's age?
   -  initiallize variable age and set to the user's response converted to an integer

   -  print when would the user like to retire
   -  Initiallize variable retire_at and set to user's response converted to an integer


   -  initiallize variable time_left and set to retire_at - age
   -  intiallize variable current_year which will be equal to accessing what year is today
   -  Initiallize variable year_retire to equal current_year + time_left

   -  interpolate string "It's (--) You will retire in (--)"
   -  interpolate string "You have only (--) years of work to go "

C: Code with intent

=end



def retire_when?()
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

 retire_when?


