=begin
P. Understand the Problem
Problem Statement: We are tasked with implementing a singly linked list data structure. The linked list should support the following operations:

Push: Add an element to the front of the list.
Pop: Remove and return the first element from the list.
Peek: Retrieve (but do not remove) the first element from the list.
Size: Return the number of elements in the list.
Empty: Determine whether the list is empty.
To Array: Convert the linked list to an array.
Reverse: Create a new linked list that is the reverse of the original list.
Create from Array: Create a linked list from an array in reverse order.
E: Examples/Edge Cases
Let's consider some examples and edge cases:

list = SimpleLinkedList.new

list.push(1)
list.push(2)
list.push(3)

list.size
# => 3

list.peek
# => 3

list.pop
# => 3

list.to_a
# => [2, 1]
D: Data Structures
SimpleLinkedList: The main class representing the linked list.
Element: A class representing elements in the linked list, consisting of a datum (data) and a next reference to the next element.
Arrays: Used for converting the linked list to an array.
A: Algorithm
Define the Element Class:

Create a class called Element to represent individual elements in the linked list.
Each Element should have:
A data attribute to store the element's value (referred to as datum).
A reference to the next element in the list (referred to as next).
Implement the SimpleLinkedList Class:

Create a class called SimpleLinkedList to manage the linked list as a whole.
Initialize class variables:
size to keep track of the number of elements in the list (initialize to 0).
head to point to the first element in the list (initialize to nil for an empty list).
Implement Instance Methods for SimpleLinkedList Class:

initialize:

Set size to 0.
Set head to nil.
empty?:

Check if size is 0.
Return true if it's 0 (indicating an empty list), otherwise return false.
push(datum):

Create a new Element with the given datum.
Set the next reference of the new element to the current head.
Update head to the new element.
Increment size by 1.
peek:

Return the datum of the first element (head) if the list is not empty.
Otherwise, return nil.
pop:

Check if the list is empty (size is 0).
If not empty:
Retrieve the datum from the head.
Update head to point to the next element in the list.
Decrement size by 1.
Return the retrieved datum.
If the list is empty, return nil.
size:

Return the current value of size.
head:

Return the current value of head.
tail?:

This method can be customized as needed based on the desired behavior. In the provided code, it always returns true.
next:

Return the next element if head exists (i.e., there's at least one element in the list).
to_a:

Initialize an empty array called result.
Start from head and iterate through the elements:
Append the datum of each element to result.
Return the resulting array.
reverse:

Create a new empty SimpleLinkedList called reversed_list.
Iterate through the elements of the original list:
Push each element's datum to the front of reversed_list.
Return reversed_list.
self.from_a(array):

Create a new empty SimpleLinkedList called list.
If the input array is nil, return the empty list.
Reverse the input array.
Iterate through the reversed array and push each element onto list.
Return list.
Use the SimpleLinkedList Class:

Instantiate a SimpleLinkedList.
Use the provided methods to manipulate and query the linked list as needed.

C: Code with Intent





=end
# Define the Element class
class Element
  attr_accessor :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

# Modify the SimpleLinkedList class
# Modify the SimpleLinkedList class
class SimpleLinkedList
  attr_reader :size

  def initialize
    @size = 0
    @head = nil
  end

  def empty?
    @size.zero?
  end

  def push(datum)
    new_element = Element.new(datum, @head)
    @head = new_element
    @size += 1
  end

  def peek
    @head&.datum
  end

  def pop
    return nil if empty?

    popped_datum = @head.datum
    @head = @head.next
    @size -= 1
    popped_datum
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail?
    true
  end

  def next
    @head.next if @head
  end

  def to_a
    result = []
    current = @head
    while current
      result << current.datum
      current = current.next
    end
    result
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    current = @head
    while current
      reversed_list.push(current.datum)
      current = current.next
    end
    reversed_list
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?

    array.reverse.each { |datum| list.push(datum) }
    list
  end
end
list = SimpleLinkedList.new
list.push(1)
p list.head
#assert_instance_of Element, list.head
#assert_equal 1, list.head.datum
#assert list.head.tail?
