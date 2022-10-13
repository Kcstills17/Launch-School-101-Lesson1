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
   "this the arr #{arr}"
  arr.map do |num|
     "this is the num #{num} and this is the arr #{arr}"
    num * 2
  end
end

=begin
1.  line 83: a nested array has the method map called onto it
2. line 83: using map the array is iterated through with the local variable arr
3. line 84-87: the contents of the map block method are enacted
4. line 84: on local variable arr the map method is called
5. line 84: with map arr is iterated through and the inner elements are set to local variable num
6. new transformed array is created from map
7. line 84-86: contents of second block are enacted
8. line 85: num * 2 is output.
9. line 85: this is the final line of our blocks and thus the return value
10. line 85: map creates a new array and transforms it based on the result of the block on the original object
11. line 85: this returns a new result with num * 2 on every version of num
12. result should be  => [[2,4], [6,8]]
=end

# 6.
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
      value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
=begin
1 line 107: an array containing two nested hashed is iterated through with the method select on the original object
2. line 107-111 select's block contents with the local variable hash are executed on each sub hash
3. line 108: with our sub hashes a new block is created with the local variables key and hash
4. line 108: the method all? is run on this block. hash contains two elements. The key,value pair of a and b, and the key value pair of c. This is relevant with the return value of all?
5. line 108- 110: contents of the inner block
6. line 107-109: select returns all values that evaluate as true and all? returns true if false or nil are never given
7. line 109: a and c both are true for the block value, however due to the all? method a still is considered false due to b being false within the same hash.
8. therefore with select the return value is [{c:'cat'}]
=end

# 7.

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  #p element1
  element1.each do |element2|
    #p element2
    element2.partition do |element3|
     # p "this is element1 #{element1}"
     # p "this is element2 #{element2}"
     # p "this is element3 #{element3}"
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

=begin
1. line 128: we have a triple nested  array that is having the method map called onto it
2. line 128: element1 is the local variable created to go down one layer of the nest   [[1], [2], [3], [4]]
[["a"], ["b"], ["c"]]
3. line 130:  the each method is called on element1
4. line 130: the local variable element 2 is created representing the next layer of arrays [1] [2] [3] [4] [a] [b] [c] [d]
5. line 130: each returns the original object that is being called on  and does not take into account the return value of the block
6. line 130: because of this each while map still creates a new version of the original object. The new object will have the same contents
7. line 132: the method partiion is called on element2. This represents the last layer of the array 1 2 3 4 a b c d
8. line 132: partition creates 2 separate arrays. The first for which the elements are true, and the 2nd are the rest.
9. line 136: the final return value is based on the condition of element3.size > 0
10. line 136: all  instances of element3 are true in this condition however each does not take into account any block return values
11. Therefore the new array created by map with the same contents as the original object due to each is returned
=end



# 8.

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
   #p "this is arr #{arr}"
  arr.map do |el|
    p "this is el before #{el}"
    p el.to_s.size
    if el.to_s.size == 1    # it's an integer
      el + 1
     # p "this is el   #{el}"
    else                    # it's an array
      el.map do |n|
        #p "this is n before increment#{n}"
        n + 1
       # p "this is n after increment#{n}"
      end
    end
  end
end

=begin
1. line 161: we have a triple nested array  with the method map being called onto it
2. line 161: this creates a new array with transformed elements.
3. line 161: the local variable arr is created to represent the first layer of the nested array [[1,2], [3,4]]
4. line 163: arr has the method map called onto it creating a new transformed array
5. line 163: within this 2nd map method the local variable el is created representing the second layer in the nested array [1, 2] [3, 4] 5 6
6. line 165-166: an if statement is declared  with the condition that el.to_s.size == 1. this tests if it is an integer. if so increment el by 1.
7. line 166-167: 5 and 6 were not nested as deeply and are at their lowest levels. They both have the a size of 1 in this condition and thus would be able to execute the if statement
8. line 169-172 [1,2] [3,4] still have another layer and in our else condition we create a new block with the method map being executed.
9. line 170-172: local variable element n created and accesses last layer of nest 1 2 3 4.  n is incremented by 1
10.line 167/172: these are the final return values of the code in each brancg. a new array with transformed values based on this blocks return value is created
11. return is => [[[2, 3], [4, 5]], [6, 7]]

=end



# we have an array of hashes, and we want to select all elements where every key matches the first letter of the value.
# Note that the keys are symbols here, so we'll have to do some conversion before comparison.
