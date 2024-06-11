=begin

P. Understand the Problem
  Explicit Requirements:
  - Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask,
it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should
not allow the use of the same name twice.

  Implicit Requirements:
  - two instance methods. #name and #reset
  - this format   NAME_REGEXP = /^[A-Z]{2}\d{3}$/
   provides clarification of how the name should generally look.
   - the str should start with 2 uppercase characters followed by 3 integer values.
   - we should be able to reset the name of each assigned object with the `reset` method
   - reset will create a new name for the object that is being invoked upon
   - name needs to provide a randomly generated value when no value is set. However when a value is set we do not want to set a new value
    - name needs to return a Robot object. So the name should be assigned to an instance variable that returns the result of a
  - the test case shows if a name that is generated is already taken then we must then generate another name in that case.
  Clarifications/ Questions:
  -

E: Examples/ Edge Cases

D: Data Structures
  - input: none
  - output: string
  - possible intermediary structure: array

A: Algorithm
- create Robot class
- create class variable @@names and set to an empty array
  - initialize @upper_letters to an array of all uppercase letters
  - initialize @generated_name to nil
  - create a gettermethod for @upper_letters and an accessor method for generated_name
  - create 2 private methods
    -random_letters which will create an array that is a size of 2 and will randomly choose from  upper_letters. return this array joined.
    - random_digits which create an array that is the size of 3 and iterate through all digits 0-9 randomly. return this array joined
  - create name method
    - for our name method we have to account for a couple of things. If our value is set, not set, or if it has already occurred somewhere amongst any instance of the class
      - so first return generated_name if it is not nil as this value is what we will set the return vallue to be
      - enter a loop
        - initialize joined_values to the result of adding random_letters and random_digits
        - we will always execute the following  unless @@names includes joined_values
          - append joined_values to @@names
          - set generated_names to joined_values and exit the loop
      - return generated_names

C: Code with intent

=end

class Robot
  @@names = []
  attr_accessor :generated_name

  def initialize
    upper_letters = ("A".."Z").to_a
    @generated_name = nil
  end

  def name
    return generated_name if generated_name

    loop do
      joined_values = random_letters + random_digits
      unless @@names.include?(joined_values)
        @@names << joined_values
        self.generated_name = joined_values
        break
      end
    end

    generated_name
  end

  def reset
    self.generated_name = nil
  end

  def self.names
    @@names
  end

  private

  def random_letters
    upper_letters = ("A".."Z").to_a
    Array.new(2) { upper_letters.sample }.join
  end

  def random_digits
    Array.new(3) { rand(10).to_s }.join
  end
end
name = Robot.new
p name.name == name.name
