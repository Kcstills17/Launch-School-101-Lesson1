
require "pry"
require "pry-byebug"
=begin
1. Countdown

Our countdown to launch isn't behaving as expected. Why? Change the
code so that our program successfully counts down from 10 to 1.
=end

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
 # puts counter
  decrease(counter)
end

#puts 'LAUNCH!'

# we output  counter 10 times due to the `times` method on line 14- 17. However the value of `counter` is `10` every time.
# this shows that counter is either not being decremented or its is being set back to `10` after each iteration.  the `decrease` method definition on line 8-10
#  reassigns the counter to the return value of  the `#-` method being invoked upon `counter`. following this method on line 12 we initialize local variable counter
# to integer object value `10`. Within our `times` method we output counter with the `#puts` method. Then invoke the `decrease` method with the integer value that counter
# references passed in as an argument  into `decrease`.

# The issue is that the value being output for `counter` is still the integer object value `10` every time. When `decrease` is invoked on the value of `counter`
# that result is not being stored. A possible solution is within the `times` method output the value of `counter`
 # and then reassign counter to the return value of `decrease` being invoked onto  the value of `counter`. This way counter is being reassigned at each
 # integer value from `10` to `1`
#
#e.g.
def decrease(counter)
  counter -= 1
end

counter = 10
10.times do
 # puts counter
  counter =  decrease(counter )

end
#puts "LAUNCH!"

=begin
2. HEY YOU!

String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU?
 Modify the code so that it produces the expected output.
=end

def shout_out_to(name)
  name.chars.each { |c| p c.upcase! }

  #puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

=begin
on line 52-56 method definition `shout_out_to`` is defined. On line 58 shout_out_to is invoked and passes in
the string object value `'you'` as an argument and binds to the parameter value name within the
`shout_out_to` method definition and set as a local block variable. on line 53 the method `#chars` is invoked upon
`name` which splits each string character apart and then adds to a new array object value. each value is passed
into the block once and assigned to local block parameter `c`. Within the block the `#p` method outputs the value of
the return value of `upcase!` being invoked upon `c`. This is a mutating method and will affect the original object
at each iteration of `c`. Each object however is not the same object that name is in reference to. So when the `#puts`
method is invoked upon the string object '`HEY'` and name the lower case string `'you'` will still output.

To fix this problem remove the block iteration within the method definition of `shout_out_to` on line 53-56 and instead invoke
the method `#upcase!` on the value that name references. Then when the output provided by the invocation
of `#puts` is shown `'HEY YOU'` should be the expected value

=end

def shout_out_to(name)
  name.upcase!

  #puts "HEY " + name
end

shout_out_to('you')


=begin
3. Valid Series?

The valid_series? method checks whether a series of numbers is valid. For the purposes of this exercise, a valid series of numbers
must contain exactly three odd numbers. Additionally, the numbers in the series must sum to 47.

Unfortunately, our last test case is not returning the expected result. Why is that?

=end


def valid_series?(nums)
  return false if nums.sum != 47

    odd_count = nums.count { |n|  n.odd? }
   odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])    == true     # should return true
p valid_series?([1, 12, 2, 5, 16, 6])     == false        # should return false
p valid_series?([28, 3, 4, 7, 9, 14])        == false     # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])   == true      # should return true
p valid_series?([10, 6, 19, 2, 6, 4])       == false       # should return false

=begin
on line 96-101 method definition `valid_series?` is defined. on line 103-107 5 separate array objects are each passed into `valid_series?` as an argunment
and each value is bind to `valid_series?` parameter `nums`. Then  `nums` is assigned as a local method variable . On line 97
 the boolean value `false` is explicitly returned when the return value of  the method `#sum` is invoked on `nums` and  is not equal to the integer
 value `47`. This is due to the `if` conditional statement. On line 99 local method variable `odd_count` is initialized and set to the return value
 of the `#count` method being invoked upon `nums`. a block is invoked and each value within the collection of `nums` is passed into the block once and assingned
 to local block variable `n`. the  `#odd?` method is invoked upon `n`. The return value of the block is based upoon how `#count` returns an integer value for the
 number of specified items that are considered an odd number in this specific case.  On line 100  the a ternary condition is created and evaluates that `odd_count`
is assigned to integer value `3` and if that condition is `true` return `true` else `false`.

The fix for this issue is that on line 100 `odd_count` is assigned to the value of `3` instead of being compared for equality. Change the `=` assignment into the
#==` method  and each condition passes.

=end

=begin
4. Reverse Sentence

The reverse_sentence method should return a new string with the words of its argument in reverse order, without using any
of Ruby's built-in reverse methods. However, the code below raises an error. Change it so that it behaves as expected.
=end

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
   # reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'


=begin
 On line 131- 142 the method definition `reverse_sentence` with a single parameter is defined. ON line 144 `reverse_sentence` is invoked and the string
 object value `'how are you doing'` is passed through as an argument and bind to parameter `sentence`. On line 132 local method variable `words` is initialized
 to the return value of the `#split` method being invoked upon `sentence` with the delimiters of `' ' `. This method splits up each `string` character onto a collection
 within a new array object with the delimiter as placeholders between each character. On line 132 local method variable `reversed_words` is initialized to an empty array.
 On line 135 local method variable `i` is initialized to integer value `0`. On line 136 -139 a `while` loop is run. On line 136 the condition to run is that `reversed_words`
 is assigned to `words[i]`, which represents the place of the string's  + `reversed_words`. This will raise a `TypeError` as you cannot use the `#+` method
 between a string value and an array.

 To fix this we change line 137 to invoke the `#unshift ` method onto `reverse_words` This method appends the specified object value to the beginning of the
 array structure. In this case we will append `word[i]`. Following the rest of the code will remain unchanged and the correct value should be returned.
=end

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0

  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

 reverse_sentence('how are you doing')

=begin

 5. Card Deck

 We started working on a card game but got stuck. Check out why the code below raises a TypeError.

Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?

=end


cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end


# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
 deck[suit]
   cards = deck[suit]
   cards.shuffle!
  player_cards << cards.sample
end



# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (test, remaining_cards)|
 remaining_cards
  suit_total = remaining_cards.map do |card|
     card
     score(card)

  end

 remaining_cards
   sum += suit_total.sum
end

=begin
The error is a `#TypeError` as the local variable `sum`is in reference to  an integer value and `remaining_cards` is a reference to an array object containing
a collection of integer value objects and symbol value objects. `sum` is being attempted to be reassinged to the return value of the `#+` method being invoked upon
#`sum` and the return value of `remaining_cards` being invoked by the `#sum` method. That evaluates the total of all elements within an enumerable. However the elements
in this case are both integer type and symbol type which cannot be coerced together. To figure out how to get a total number of all of the card values we should first
initialize variable `suit_total` on line 217  and set to the return value of  `#map`  being invoked upon the local block variable `remaining_cards`. With this we have
the total value of integers stored. On line 223 we assign `sum` to the return vale of the method `#sum` being invoked upon the transformed array created from `#map` which
will evaluate the total of each integer object value. This shall be done on each itration of the `#reduce` method and the final result will be the value `sum` is assigned to.

Now we have a `sum` value but we are missing a few cards. on line 209-214 a block invocation is run. each car that is popped off and then added to players_card through
the method`#pop!` is in reference to the same object. So on each iteration of the block the same object is having a single element removed every time.
To solve this on line 213 replace the `#pop!` with `#sample` which will emulate the same results in this case but not modify the object they each reference
on each iteration.
=end


=begin

6. Getting things done

We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list,
but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?

=end

def move(n, from_array, to_array)

  to_array << from_array.shift
  return to_array if n == 1
  p move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog']
done = ['apply sunscreen', 'go to the beach', "say hello to neighbor "]

 move(2, todo, done)

 todo # should be: ['coffee with Tom']
 done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']


=begin
Due to the effects of the recursive function call `#move(n-1, from_array, to_array)` a call stack error has been raised. `SystenStackError`. This is typically
a result of some erroneous evaluation being performed that lacks a condition to escape the action. Here there is nothing that tells this program to cease with
the recursive action. Ruby will continue to put a call over call within the stack until it reaches a limit which causes this error to be thrown.
=end



=begin

7. neutralizer

We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

=end

def neutralize(sentence)
  words = sentence.split(' ')
  new_words = words.reject  do |word|
    negative?(word)
  end

  new_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.


=begin
within the `neutralize` method each word that is considered negative by the `negative?` method is meant to be deleted. However, If you use the `#each_with_index`
method to view each `word` and `words` prior to invoking the `negative?`method on `word` and then viewing `words` following it. We can see that as a result of the mutating
method `Array#delete` as we move further along in the iteration certain items are being skipped because of their new index position at each iteration. For example after removing
`'dull'` we are at index 1 and the next word considered negative `'boring'` is moved down to index 1. On the next iteration on index 2, we have already skipped `'boring`'.

A possible solution is on line 293 in place of the `#each` method being invoked instead invoke the `#reject` method. With that pass each item from the original collection
`words` each time once. `#reject` will return all values that are not truthy. So If we set the condition to evaluate to true to be our `#negative?` method being invoked
upon block parameter `word`. Then all non negative words should be returned as falsy values.
=end


=begin

8. Password

The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password.
However, the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.
=end

=begin
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
 new_password
end

def verify_password(pswrd)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == pswrd
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
=end


=begin
The error that raises `undefined local variable` arises due to the fact that local variable `password` that is initalized on line 336 to `nil` and then compared for equality
on line 349 is not within the scope of our method definiton `set_password` in which the local method variable `password` is not accessible outside of the method.

We can fix this by within the method definition `set_password` remove the assignment of local method variable `password` to `new_assignment` to remove some
possible confusion. Then on line 344 create a parameter for method definition `verify_password`. Pass in local variable `password` as the argument to
be bind to the parameter `pswrd`. With this,  The value that is referenced by `password` in the outer scope can be accessed within `verify_password`
and compared accordingly. On line 357 assign to password the return value of the invocation of `set_password` so when there is no password
a new value is stored from `set_password`'s return value.
=end

=begin

9. Number guessing game

A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1 and a provided maximum number
 and offers you a given number of attempts to guess it.

However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior. Can you figure out what is wrong?

=end
=begin
def valid_integer?(string)
  string.to_i.to_s == string
end

attempt = 0

def guess_number(max_number, max_attempts, attempts)
  winning_number = (1..max_number).to_a.sample


  loop do
    p attempts
    p max_attempts

    break if attempts >= max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    elsif  guess < winning_number
      puts 'Nope. Too small.'
      attempts += 1
    else
      puts 'Nope. Too big.'   if guess > winning_number
      attempts += 1

      # Try again:
      #guess_number(max_number, max_attempts, attempts)
    end
  end
end

guess_number(10, 3, attempt)
=end
=begin
It seems when you choose a number to guess the code is changing the result after each guess. Based on choosing the same result multiple times and getting different
answers. Also There is no break when it comes to attempts or when you win the game.

To first fix the issue with attempts we can initallize a local variable `attempt` on line 390 and assign to it the integer value `0`. We will use   `attempt` as an extra
argument to be passed into the method definition `guess_number`.  Modify the break `if attempts > max_attempts` to `#>= to get the 3 attempts we are aiming for.
We then modify our if conditional statements to an if statement, an ifels, and an else statement.each statement based on whether you win, have a smaller number,
 or greater. After each print statement reassign local method variable `attempts` to the result ofreassigning the value of `attempts` and the invocation
of the `#+` method. This will allow the program to break out based on the `max_attempts` method variable as intended.

To break out of the loop  when you win the game. On line 412 following the `if` condition that you have won and the consequent output insert the `break` condition.

To fix the result we remove #`guess_number` which is being invoked within the method itself. This causes each value to be reset after each guess. So removing this allows for
the program to run as intended.




=end

#LS far more simple solution

=begin
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # simply re-enter the loop for the next attempt
    end
  end
end

guess_number(10, 3)
=end

# all that needed to be done was insert a `break` after the win condition and remove the recursive calling of `guess_number` within the method itself.


=begin

9. TF-IDF

A friend of yours wants to build a basic search engine and starts reading up on information extraction. He decides to try a simple
implementation of TF-IDF, a measure of the information content a term holds for a particular document in a document collection.
However, he just started learning to code and somehow his numbers do not match what is expected. He knows you're enrolled in an
awesome developer school, so he asks you to have a look.



=end

# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)

def tfidf(term, document, documents)
  #p tf(term, document)
  # idf(term, documents)
  document_result =  tf(term, document) * idf(term, documents)
   document_result.round(1) > 0 ? document_result.round(1) : 0
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
    document.split(/[\s,.-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)

   number_of_documents = documents.length
    number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

    Math.log(number_of_documents / number_of_documents_with_term.to_f)
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger
 devised " + "it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously
exist in all possible configurations, " +" a state called quantum superposition, and only observing the system forces the object into just one of those possible states.
Schrödinger disagreed with this interpretation. In particular, " +"quantum superposition could not work with larger objects. As an illustration, he presented a scenario
with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " + "In a quantum superposed state of the subatomic particles, the cat
would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and
leopards. " + "Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat
Day is celebrated on August 8. " + "Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to
becoming a competent and confident Software Engineer " + "is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based
Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " + "but a continual learning journey of micro-improvements. At Launch
School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come,"
 + "such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application
work. Everything we're trying to do at " + "Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
#puts tfidf("cat", document1, documents) # ~ 1.2
#puts tfidf("cat", document2, documents) # ~ 1.6
#puts tfidf("cat", document3, documents) # 0

#puts tfidf("quantum", document1, documents) # ~ 5.5
#puts tfidf("quantum", document2, documents) # 0
#puts tfidf("quantum", document3, documents) # 0

#puts tfidf("mastery", document1, documents) # 0
#puts tfidf("mastery", document2, documents) # 0
#puts tfidf("mastery", document3, documents) # ~ 4.4

#puts tfidf("some", document1, documents) # 0
#puts tfidf("some", document2, documents) # ~ 0.4
#puts tfidf("some", document3, documents) # ~ 0.4


=begin

the Issue within this problem lies within the method definition `idf`. We are meant to acquire the score for how rare specific information is within a document. However
when you perform the `Math.log` method  you end up with a result of `0.0`. This is because the two values being divided `number_of_documents`  `/`
`number_of_documents_with_term` are both integers. We need to convert both to a float with the `#to_f` method.

Now within `idf` initialize a variable `document_result` and assign it the return value of the evaluation on line 510. On the next line round `document_result` to the
tenth decimal place. Now our results are correct however if the value is 0 it will return 0.0. So to account for that on line 512 execute a ternary operator which based
on  `document_result.round(1) > 0 ` being true return that return value. If that is not true return `0`
=end


=begin
10. What is wrong with the output?

Josh wants to print an array of numeric strings in reverse numerical order. However, the output is wrong.
Without removing any code, help Josh get the expected output.

=end


arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
   p  y.to_i <=> x.to_i
  end

p arr.sort {|x,y| y.to_i <=> x.to_i}

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]

=begin
the issue is that when using a `do..end` block to be passed into as an argument the precedence of `do..end`` binds `p` and `sort` more  tightly.
Essentially causing the problem to be
```
(p arr.sort) do |x,y|
  y.to_i <=> x.to_i
end
```
To get around this issue one solution would to use curly braces as opposed to `do..end` block. Another alternative would to have `p` outide of parenthesis which contain
the entirety of the block. e.g.

```
p(
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)
```

=end


=begin

write a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is
'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur
 at least 3 times, return nil.


P. Understand the Problem
  Explicit Requirements:
  - we must determine and return the index of the 3rd occurence of the given or passed in argument character in a string.
  -  if the given character does not occur 3 times then return nil

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
    third_occurence_index('x', 'axbxcdxex') => 6

D: Data Structures
  - input: input is two parameters, one the string character you are checking for occurences, and two the string you are searching
  - output: an integer object value that represents the 3rd occurrence of a particular string
  - possible intermediary structure: a possible array


A: Algorithm
def third_occurence_index(value_occurence, str)
  -initialize third_index and assign an empty array object value
    - iterate through `str` and passed each string char one time into the block and bind to local block variable `char` Iterate through each idx at each iteration and bind to `idx`
      - within the block check if  `char` values are  equal to `search_value`
        - if true append the `idx` to  `third_index`
      -end
end
check `third_index` at position 2 or index 3 to return the value that we want.
end


C: Code with intent

=end

def third_occurence_index(search_value, str)
  third_index = []
   str.chars.each_with_index do |char, idx |
  if search_value == char
    third_index << idx
  end
  end
  third_index[2]
end



 third_occurence_index('x', 'axbxcdxex') == 6
 third_occurence_index('a',  'hello') == nil


 nested_arr = [[38, 16], [28, 39], [40, 5], [24, 19], [27, 19], [35, 14], [8, 37], [16, 47], [47, 46], [24, 28]]



 a = 5.2
 b = 7.3
 a = b
 b += 1.1

  a
  b


  colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
  things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

  colors.shuffle!
  things.shuffle!

  i = 0
  loop do
    break if i >= things.length

    if i == 0
      puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
    else
      puts 'And a ' + colors[i] + ' ' + things[i] + '.'
    end

    i += 1

  end
