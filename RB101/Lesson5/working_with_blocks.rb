# take the time to deconstruct problems and go over what exactly is occuring at eacch step

# 1.
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

=begin
1. we have a nested array thats being iterated through.
2. the first index of each element is outputted due to the puts method
3. puts always returns nil so nil is returned
4. each does not evaluate the return statement and always returns the original object
5. in this case => [[1,2], [3.4]]
=end

# 2.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

=begin
1. nested array is iterated with the map method
2. the first index of each array is outputted due to the puts method
3. puts is the last statement and therefore returns nil
4. map transforms arr but in this case the only return value is nil
5. map always returns the same amount of values as the original object.
6. new array is created with nil at each index of the outer array
=end

# 3.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

=begin
1. nested array is iterated through with map
2. puts arr.first outputs index 0 at each inner array
3. the final line is arr.first and is thus the return value
4. map transforms arr and returns a new array
5.  the new array is based on the result of arr.first on the block elements arr
6. output  should be
# 1
# 3
# => [1, 3]
=end


# 4.

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

=begin
1. line 59 : variable my_arr is assigned a nested array
2. line 59: the method each is being called on my_arr
3. line 59-65 : method each is iterated on each element of my_arr. those elements are under local variable arr
4. line 60:  the method each is called on local variable arr
5. line 60-65:  arr is iterated through with each and every inner element of arr is named local variable num
6. line 61 : if statement is created to that gives the condition if num > 5
7. Line 62: puts num if the conditional is true
8. line 62: puts num is the final line of the block and thus is the return value. Puts always returns nil
9. line 59/60: each does not evaluate the return value of the block and returns the original object, thus the original object is returned for the each statements
10. final result is 1 and 3 are printed and the original array is returned

=end

# 5.

[[1, 2], [3, 4]].map do |arr|
  p "this the arr #{arr}"
  arr.map do |num|
    p "this is the num #{num} and this is the arr #{arr}"
    num * 2
  end
end

=begin
1.  line 83: a nested array has the method map called onto it
2. line 83: using map the array is iterated through with the local variable arr
3. line 84-87: the contents of the map block method are enacted
4. line 84: on local variable arr the map method is called
5. line 84: with map arr is iterated through and the inner elements are set to local variable num
6. new transformed array is created from map and it's return value is self
7. line 84-86: contents of second block are enacted
8. line 85: num * 2 is output.
9. line 85: this is the final line of our blocks and thus the return value
10. line 85: map creates a new array and transforms it based on the result of the block on the original object
11. line 85: this returns a new result with num * 2 on every version of num
12. result should be  => [[2,4], [6,8]]
=end
