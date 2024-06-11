=begin
1. Listening Device

Below we have a listening device. It lets us record something that is said and store it for later use. In general, this is how the device should be used:

Listen for something, and if anything is said, record it for later use. If nothing is said, then do not record anything.

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
end

Anything that is said is retrieved by this listening device via a block. If nothing is said, then no block will be passed in. The listening device can also output the most recent recording using a Device#play method.

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play Outputs "Hello World!"

Finish the above program so that the specifications listed above are met.

=end


class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      recording = yield
      record(recording)
    end
  end

  def play
    puts @recordings.last
  end
end




listener = Device.new
 listener
 listener.listen { "Hello World!" }
 listener.play
listener.play Outputs "Hello World!"


=begin
2. Text Analyzer - Sandwich Code

Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." You should read the text from a simple text
file that you provide. (We also supply some example text below, but try the program with your text as well.)

This question requires that you read a simple text file. Try searching the Web for information on how to do this, and also take a look at the
File class in the Ruby documentation. If you can't figure it out on your own, don't worry: just put the data directly into your program; an Array
with one element per line would be ideal.

Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the
#process method or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output but should have the indicated format.

class TextAnalyzer
  def process
    your implementation
  end
end

analyzer = TextAnalyzer.new
analyzer.process { your implementation }
analyzer.process { your implementation }
analyzer.process { your implementation }

Sample Text File:
sample_text.txt

Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
sit consequat cupidatat.

Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
aliqua ea sunt ex nisi non.

Officia dolore labore non labore irure nisi ad minim consectetur non irure
veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
commodo.

Sample Output:

3 paragraphs
15 lines
126 words


=end

class TextAnalyzer
  def process
    yield if block_given?
  end
end

analyzer = TextAnalyzer.new

paragraph = <<~PARAGRAPH
  Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
  enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
  aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
  nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
  sit consequat cupidatat.

  Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
  aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
  pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
  elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
  aliqua ea sunt ex nisi non.

  Officia dolore labore non labore irure nisi ad minim consectetur non irure
  veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
  commodo.
PARAGRAPH
sentence_count = paragraph.scan(/[.?!]/).size
paragraph_count = paragraph.split(/\n\n/).size
word_count = paragraph.split.size

analyzer.process { puts "#{paragraph_count} paragraphs"}
analyzer.process   { puts"#{sentence_count} sentences" }
analyzer.process { puts "#{word_count} words"}






=begin

3. Passing Parameters Part 1

Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end


=end


def gather(items)
 puts "Let's start gathering food."
  yield(items)
 puts "Nice selection of food we have gathered!"
end

items = ['apples', 'corn', 'cabbage', 'wheat']

 #gather(items) {|item| puts item.join(', ') }



=begin

4. Passing Parameters Part 2

Ruby gives us a lot of flexibility when assigning arrays to variables. If we want to assign the entire array to a single variable, we can do that:

birds = %w(raven finch hawk eagle)
 birds => ['raven','finch','hawk','eagle']

If we want to assign every element to a separate variable, we can do that too:

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
 raven => 'raven'
 finch => 'finch'
 hawk => 'hawk'
 eagle => 'eagle'

Suppose we want to organize our array contents into groups, where variables represent category names.
Can we do that without extracting items directly from the array based on their indices?

We can use the splat operator(*) to do something like this:

raven, finch, *raptors = %w(raven finch hawk eagle)
 raven => 'raven'
 finch => 'finch'
 raptors  => ['hawk','eagle']

Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block,
which should assign your block parameters in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.


=end



=begin
5.  Passing Parameters Part 3

Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

1)

gather(items) do | , |
  puts
  puts
end

Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!

2)

gather(items) do | , , |
  puts
  puts
  puts
end

Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!

3)

gather(items) do | , |
  puts
  puts
end

Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!

4)

gather(items) do | , , , |
  puts
end

Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!



=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*item|
 puts item.join(', ')[0..-6]
 puts item.join(', ')[-5..-1]
end

gather(items) do |*three_items, item|
 puts three_items.select {|i| i  == 'apples'}
 puts three_items.select {|i| i != 'apples'}.join(', ')
 puts item
end

gather(items) do |*item|
 puts item.join[0..5]
 puts items.join(', ')[8..-1]
end

gather(items) do |item1, item2, *items|
   [item1, item2, items].join(', ')
end









birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
 raptors
 puts "Raptors: #{raptors.join(', ')}."
end


=begin


6. Method to Proc

In our Ruby course content on blocks, we learn about "symbol to proc" and how it works. To review briefly, consider this code:

comparator = proc { |a, b| b <=> a }

and the Array#sort method, which expects a block argument to express how the Array will be sorted. If we want to use comparator to sort the Array,
we have a problem: it is a proc, not a block. The following code:

array.sort(comparator)

fails with an ArgumentError. To get around this, we can use the proc to block operator & to convert comparator to a block:

array.sort(&comparator)

This now works as expected, and we sort the Array in reverse order.

When applied to an argument object for a method, a lone & causes ruby to try to convert that object to a block. If that object is a proc, the conversion
happens automatically, just as shown above. If the object is not a proc, then & attempts to call the #to_proc method on the object first. Used with symbols,
e.g., &:to_s, Ruby creates a proc that calls the #to_s method on a passed object, and then converts that proc to a block. This is the "symbol to proc" operation
(though perhaps it should be called "symbol to block").

Note that &, when applied to an argument object is not the same as an & applied to a method parameter, as in this code:

def foo(&block)
  block.call
end

While & applied to an argument object causes the object to be converted to a block, & applied to a method parameter causes the associated block
to be converted to a proc. In essence, the two uses of & are opposites.

Did you know that you can perform a similar trick with methods? You can apply the & operator to an object of the Method class, which is created by
Object#method. In doing so, Ruby can call Method#to_proc.

Using this information, together with the course page linked above, fill in the missing part of the following code so we can convert an array of integers
to base 8 (octal numbers). Use the comments for help in determining where to make your modifications, and make sure to review the "Approach/Algorithm" section
for this exercise; it should prove useful.

Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  n.method_name.method_name
end

Replace `argument` with the correct argument below
`method` is `Object#method`, not a placeholder
base8_proc = method(argument).to_proc

We'll need a Proc object to make this code work
Replace `a_proc` with the correct object
[8, 10, 12, 14, 16, 33].map(&a_proc)

The expected return value of map on this number array should be:

[10, 12, 14, 16, 20, 41]

You don't need a deep understanding of octal numbers -- base 8 -- for this problem. It's enough to know that octal numbers use the digits 0-7 only,
much as decimal numbers use the digits 0-9. Thus, the octal number 10 is equivalent to the decimal number 8, octal 20 is the same as decimal 16,
octal 100 is the same as decimal 64, and so on. No math is needed for this problem though; see the Approach/Algorithm section for some hints.


=end


Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  n.to_s(8).to_i
end

Replace `argument` with the correct argument below
`method` is `Object#method`, not a placeholder
base8_proc = method(:convert_to_base_8).to_proc

We'll need a Proc object to make this code work
Replace `a_proc` with the correct object
[8, 10, 12, 14, 16, 33].map(&base8_proc)

#The expected return value of map on this number array should be:

=> [10, 12, 14, 16, 20, 41]


=begin


7. Bubble Sort with Blocks

In an earlier exercise, you were asked to construct a #bubble_sort! method that used the bubble sort algorithm to sort Arrays in place. Our solution was this:

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

The problem with this solution is that it doesn't give you any freedom in terms of the criteria used for the sort. For example, perhaps you want to sort the
Array in reverse order from usual, or perhaps you want to sort a list of names in a case-insensitive manner.

Your task in this assignment is to modify #bubble_sort! so it takes an optional block that determines which of two consecutive elements will appear first in the
results.

If you still have a copy of your #bubble_sort! method, you may use that method as the basis for this exercise. Otherwise, you can use the above solution.

Examples:


=end

def bubble_sort!(array)
   return array.sort! if !block_given?
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if yield(array[index - 1], array[index])
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end



array = [5, 3]
#bubble_sort!(array)
array
array == [3, 5]

 array = [5, 3, 7]

bubble_sort!(array) { |first, second| first >= second }
 array


array = [6, 2, 7, 1, 4]
bubble_sort!(array)

array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array

array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)


