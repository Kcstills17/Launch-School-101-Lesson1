=begin
P. Understand the Problem
  Explicit Requirements:
  -The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter,
  it prints a diamond starting with 'A', with the supplied letter at the widest point.

    The first row contains one 'A'.
    The last row contains one 'A'.
    All rows, except the first and last, have exactly two identical letters.
    The diamond is horizontally symmetric.
    The diamond is vertically symmetric.
    The diamond has a square shape (width equals height).
    The letters form a diamond shape.
    The top half has the letters in ascending order.
    The bottom half has the letters in descending order.
    The four corners (containing the spaces) are triangles.

Examples

  Implicit Requirements:
  - There will be one class method `make_diamond` that takes one str argument
  - the first and last rows will have to have the same width that is different from all other rows
  - the first and last rows will be the first value or index

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 Diamond for letter up to 'C'
   A
 B B
C   C
 B B
  A

  up to 'E'



    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A


D: Data Structures
  - input: input
  - output: str
  - possible intermediary structure: array or similar iterative loop


A: Algorithm
- Create class Diamond
- we have a diamond that goes from 'A" to the given input str for the upper diamond and reverses from the final str of the sequence until the beinning again
  e.g.  A B C D E D C B  A
- create a private method called full_sequence which will take a str
  - return an array that is the result of joining together a range from 'A to str  + the same range reversed and then removing the 1st element

- create a private method determine_rows that will take in one str element
  - initialize arr to sequence_arr
  - iterate through arr and get each elem
    - if elem == 'A' then return 'A'
     - else return 'elem elem

- create a private method determine spaces
-  initialize arr to sequence_arr
 - here we have to go up out diamond in space count. And then began to go down once we have passed the midpoint
- lets create a counter and initialize this to 0. This will come in handy to the number of spaces we want later. name this spaces
 - initialize middle to the result of dividing arr.size/ 2
-  iterate through arr and get each elem and indx
      -




=end
class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
    end.join("\n") + "\n"
  end

  class << self
    private

    def make_row(letter)
      return "A" if letter == 'A'
      return "B B" if letter == 'B'

      letter + determine_spaces(letter) + letter
    end

    def determine_spaces(letter)
      all_letters = ['B']
      spaces = 1

      until all_letters.include?(letter)
        current_letter = all_letters.last
        all_letters << current_letter.next
        spaces += 2
      end

      ' ' * spaces
    end

    def max_width(letter)
      return 1 if letter == 'A'

      determine_spaces(letter).count(' ') + 2
    end
  end
end
