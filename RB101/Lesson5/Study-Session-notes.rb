 a = [[1, 2, 3], [4, 5, 6, [7, 8, 9]]]

 p a[1][3][2]

# p [4, 5, 6, [7, 8, 9]][0]

# hsh = {:a => {:name => 'Zach'}, :b => {:name => 'Moriah'}, :c => {:name => 'Zane'}}.freeze

# hsh2 = hsh.dup

# hsh2[:d] = {:name => "Sandy"}

# p hsh[:b][:name] = 'Charlie'

# p hsh

# p hsh[:b][:name]

# new_hsh = hsh[:b]

# new_hsh[:name] = 'Charlie'

# p hsh


# example of going into detail with a assessment type question
=begin
#18. Explain how the method sort_by functions using the following code.
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]

On line `42` the `sort_by` method is invoked on the array object `['cot', 'bed', 'mat']` and passed in a block.
Each element is passed into the block and is assigned to the block's local variable `word`. The `sort_by` method sorts the elements of the calling object based on the blocks return value, which in our case is the character at index `1` of the current element. In Ruby strings are sorted asciinumerically so the array `["mat", "bed", "cot"]` is returned.

`sort_by` uses the spaceship operator `<=>` to compare the return values of the block, and sort the elements in the calling array accordingly. `<=>` compares two values by returning `-1` if the first operand is smaller than the second, `0` if they are equal, `1` if the first operand is larger than the second.
=end
