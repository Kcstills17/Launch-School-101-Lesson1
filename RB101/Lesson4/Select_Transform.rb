# Let's now take a look at an example with hashes. In this example we want to select the key-value pairs where the value is 'Fruit'.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
# How would you implement a method like this?
# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def select_fruit(input)
input.select do |key, value|
value == "Fruit"
end
end



p select_fruit(produce)






# If we wanted to, we could've easily decided that mutating the method argument is the right approach.
#Can you implement a double_numbers! method that mutates its argument?

my_numbers = [1, 4, 3, 7, 2, 6]

=begin
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2  # the array method #[] is a  destructive method.

    counter += 1
  end

  numbers
end

p double_numbers!(my_numbers)
p my_numbers


=end

=begin
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
=end


# Exercise for the reader: What if we wanted to transform the numbers based on their position in the array rather than their value?



def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

p double_odd_numbers(my_numbers)





def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end




# Continuing on with the idea of building generic methods, let's update our double_numbers method to not only be able to double the values in an array,
#but to multiply by any number. For example, let's create a method called multiply that can take an additional argument to determine the transformation criteria.

#my_numbers = [1, 4, 3, 7, 2, 6]
#multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]



def multiply_numbers(numbers, multiply_by)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    multiplied_numbers << numbers[counter] * multiply_by
    counter += 1
  end
  multiplied_numbers
end


  multiply_numbers(my_numbers, 4)



  # We'll wrap up this assignment with one more example from earlier. Recall our initial selection example of selecting the letter 'g' out of the alphabet.
  #Let's write a method called select_letter, that takes a string and returns a new string containing only the letter that we specified.
   # We want it to behave like this:

   # question = 'How many times does a particular character appear in this sentence?'
# select_letter(question, 'a') # => "aaaaaaaa"
# select_letter(question, 't') # => "ttttt"
# select_letter(question, 'z') # => ""


def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

p select_letter("hello world", "w")




 [1, 2, 3].select do |num|
  p num + 1

end



