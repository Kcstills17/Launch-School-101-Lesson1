## 1. Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1. ###

```ruby
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'
```

`decrease(counter)` is having `10` passed into the method as an argument but at each iteration it is the same integer being passed in. You can see this by invoking `p` on `decrease(counter`) which will output `9` 10 times.  We can change the line `puts counter` to  `counter -= 1 ` this will invoke the `-` method at each iteration and then reassign counter to this new value at each iteration. We will still be slightly off as it will count down from 9..1. To fix this we can put ` counter + 1` as now it will output 10..1 . 

```ruby
  def decrease(counter)
    counter -= 1
  end

  counter = 10

  10.times do
  counter -= 1
  p counter + 1
    decrease(counter)
  end

  puts 'LAUNCH!'

```



## 2. [String#upcase!](https://ruby-doc.org/core/String.html#method-i-upcase-21)  is a destructive method, so why does this code print `HEY you` instead of `HEY YOU`? Modify the code so that it produces the expected output.##

```ruby
def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
```

`c` references  each string object that makes up the string object `'you'`. However these are not the same object. If you were to invoke the `object_id` method on `c` and `name` that would reference different objects. remove the results of the block and invoke `upcase!` on the object that `name` references to get the correct result 

```ruby
  def shout_out_to(name)
   name.upcase!
    puts 'HEY ' + name
  end

```



## 3. The `valid_series?` method checks whether a series of numbers is valid. For the purposes of this exercise, a valid series of numbers must contain exactly three odd numbers. Additionally, the numbers in the series must sum to 47. Unfortunately, our last test case is not returning the expected result. Why is that?

```ruby
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false
```

Within the `nums.count` block the ternary condiiton `odd_count  =  3 ? true: false` is our issue. This condition assigns the integer object `3` to `odd_count` instead of checking if the object that `odd_count` references is equal to `3`. This means that every case that passes case of the sum being == to 47 will also pass the count condition by default.  We can fix this by replacing the `=` method with `==` 

```ruby
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false
```



## 4. The `reverse_sentence` method should return a new string with the words of its argument in reverse order, without using any of Ruby's built-in `reverse` methods. However, the code below raises an error. Change it so that it behaves as expected.

```ruby
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
```

Solution: 

```ruby
def reverse_sentence(sentence)
    words = sentence.split(' ')
    reversed_words = []

    i = 3
    p words[i]
    while i >= 0
      reversed_words = reversed_words << words[i]
      i -= 1

    end

    reversed_words.join(' ')
  end

  p reverse_sentence('how are you doing')
  # expected output: 'doing you are how'

```



## 5. We started working on a card game but got stuck. Check out why the code below raises a `TypeError`. Once you get the program to run and produce a `sum`, you might notice that the sum is off: It's lower than it should be. Why is that?

```ruby
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

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
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map do |card|
    score(card)
  end

  sum += remaining_cards.sum
end

puts sum
```

The error is a result of trying to add a symbol together with an integer with the result of the two blocks that `sum`  is assigned to. To fix this issue we can assign the result of the `remaining_cards.map` into a new variable which we will name `cards`. invoking the `sum` method on this object we will get us a value of the total card value. If you check `remaining_cards` with by invoking `puts` on the object it references we see that we are only returning 9 card values instead of 13. This is because within the `deck.keys.each` block this code `cards.shuffle!` is a mutating method and the following line of code `player_cards << cards.pop` is using the mutating `pop` to remove the last value at each iteration. We can fix this by removing both lines of code and replacing it with the non mutating method `sample` with this line of code `cards.sample` . 

```ruby
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

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
  cards = deck[suit]
  cards.sample
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  cards = remaining_cards.map do |card|
    score(card)
  end
p remaining_cards
  sum += cards.sum
end

puts sum

```



## 6. We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking `move` on line 11 results in a `SystemStackError`. What does this error mean and why does it happen?

```ruby
def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

```

This error occurs because of the invoking of `move` with `move(n - 1, from_array. to_array)` within the method definition `move` itself. .  This cause a call stack error as there is no clear condition to exit the program. This will continue to run until the call stack has reached a point where an error is triggered because of the amount of code that is being run. 

## 7. We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

```ruby
def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
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

```

This is a result of mutating the calling object in a method that it is iterating through the object's collection. Because of this we are getting a strange result. With the line of code ` words.delete(word) if negative?(word)`  this is deleting from the list that is being iterated through. When this occurs the index position of all items in the list are subsequently being modified. Essentially because of this some of the items in the list are then being skipped. 

## 8.  Password The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password. However, the program throws an error. What is the problem and how can you fix it? Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password
```

The line of code `input == password` raises a undefined local variable error. This is because the object that  `password` is in reference to is within the method definition `set_password` . At the top of the code `password` is assigned to `nil` however because of method definitions there is no access to this within the method of `set_password`. to fix this we need to deal with how methods access object's outside of their scope. Here we should modify the method definition `verify_password` and add a a parameter named `passwrd` . Then we shall modify the line `if input == password` to `if input == passwrd`. Now the code runs properly but we are still being asked for a password one extra time. To correct this change within the last if statement of `verify_password` to `password = set_password`. Because of this new reassignment the code will run as expected. 

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp

end

def verify_password(passwrd)

  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == passwrd
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)

```



## 9. A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1 and a provided maximum number and offers you a given number of attempts to guess it. However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior. Can you figure out what is wrong?

```ruby
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
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)
```

At every iteration the object that `attempts` references is reset. This is because the method `guess_again` is invoked recursively within the method definition `guess_again` itself. These will reset the method and at every new loop `attempts` is reassigned to `0`.  Once this is removed the code will exit after 3 attempts but will not if a victory is before the 3rd attempt. after the `puts 'yes! you win.`' line add a break statement to account for this case. 

```
def valid_integer?(string)
    string.to_i.to_s == string
  end

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

        # Try again:

      end
    end
  end

  guess_number(10, 3)

```



## 10. A friend of yours wants to build a basic search engine and starts reading up on information extraction. He decides to try a simple implementation of TF-IDF, a measure of the information content a term holds for a particular document in a document collection. However, he just started learning to code and somehow his numbers do not match what is expected. He knows you're enrolled in an awesome developer school, so he asks you to have a look.

```ruby
# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)

def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
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

  Math.log(number_of_documents / number_of_documents_with_term)
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0

puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0
puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 4.4

puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4
```

In this problem through the use of the `p` method we can look into the `idf` method definition and see where the issue is occurring. With the line of code `number_of_documents = documents.length` we get an integer value and with the line of code `  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }` we also get an integer value. However with the final line of code we are always returning `0`. This is due to the `Math.log` method which is a method meant to be invoked on a float type. If we convert `number_of_documents` to `number_of_documents.to_f` we will get values approx. to what we want. Now we have floats with more decimal places then we want. To deal with this case we edit the  `tfidf` method definition. First we initialize a variable `document_results` to the result of this line of code `tf(term, document) * idf(term, documents)` . On on the next line we create this ternary condition that will round all floats to the tenth place if the value is greater than 0. ` document_result.round(1) > 0 ? document_result.round(1) : 0` .



```
def tfidf(term, document, documents)
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

   Math.log(number_of_documents.to_f / number_of_documents_with_term)
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

```



## 11. Josh wants to print an array of numeric strings in reverse numerical order. However, the output is wrong. Without removing any code, help Josh get the expected output.

```ruby
arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 
```

The issue we have is because of the precedence of blocks. In this case a `do..end` block has the least amount of precedence and essentially what is being output by `p` is  the `sort` method being invoked on the object that `arr` references and the block below has no relevance. You can use a `{}` block and the higher precedence will allow the objects to be sorted based on the new converted integer values as a result of the block. 

```ruby
arr = ["9", "8", "7", "10", "11"]
p arr.sort {|x, y|y.to_i <=> x.to_i}

```

