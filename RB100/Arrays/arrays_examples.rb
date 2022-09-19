array = [1,2,3,4,5,6,7,7,6,4,4,5,3,5,3,2,4,2,4,]

 array.map {|num|num *2}

numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]

#puts numbers.select {|nums|nums % 2 == 0}
# this does not mutate the above array.



def mutate(arr)
  arr.pop
end

def not_mutate(arr)
  arr.select {|i|i > 3}
end

a = [1,2,3,4,5,6]
mutate(a)
not_mutate(a)
#puts a


test_flat = [1,2,3,[5,6,7],[8,9,10]]

 #test_flat.flatten
 #puts test_flat



 special_names = ['delsin', 'cole', 'trish', 'zeke', 'kuo']

 #puts special_names.each_index {|i|puts "this is their names if their names were at points #{i}"}


 value_with_index = [1,3,5,7,9,11,13,15,17]

 #puts value_with_index.each_with_index {|value, index| puts  "#{value * 10} : #{index} position"}


 array_sort = [4,1,12,6,2,19,99,22,4,55,101,19]

 # puts array_sort.sort
 # sorts the array in order of sequential or chronological order.


# puts [1,2,4].product([4,5])
# The product method can be used to combine two arrays in an interesting way. It returns an array that is a combination of all elements from all array


b = [1,3,4]
 b.map do |num|  # using do instead of curly braces. Typically you use curly braces for single lines and do for multi line.
  #puts num
end



def includes_array()
  array = [1,3,5,9,11]
  number = 3
   if array.include?(number) #self explanatory really. states either true or false if the unit is included within the array. In this case true.
    puts "The number #{number} is in the array"
  end
end

  #includes_array

  arr = ["b", "a"]
  arr = arr.product(Array(1..3)) # [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
  # the above product method  returns all possible combinations between every given part of the array.

  arr.first.delete(arr.first.last)  #1
#The above returns the deleted item from the array using the .delete method. This is using the .first method as well
# so the item is from the first subarray in the array

  #arr.each {|letters|puts letters}  # [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
  # the above is the final sequence of the array returned.




  arr2 = ["b", "a"]
   arr2 = arr2.product([Array(1..3)]) # [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
   #the above is now wrapped in [Array(1..3)] this wraps the return value of generating elements 1..3 into an element itself.
    arr2.first  # ["b", [1, 2, 3]]
   #now the above first element is this. and the last part of the element is [1,2,3] which will be used for the delete method.
   arr2.first.delete(arr2.first.last) # [1, 2, 3]

   #arr2.each {|numbers|puts numbers} # [["b"], ["a", [1, 2, 3]]]


   def return_example()
    arr = [["tests", "hello", "world"], ["example", "mem"]]
    arr.last.fetch(0)
   end

   #puts return_example


  #my_array = [15,7,18,5,12,8,5,1]
   #my_array.index(5)



   def fix_error ()
    names = ['bob', 'joe', 'susan', 'margaret']
    names[3] = 'jody'
    puts names
   end
  #puts  fix_error


  def each_with_index_example ()
array = [1,2,3,4,5,6,7,8,9,10]
array.each_with_index{|value, index| puts "value is #{value **2} and the index at each position is #{index }"}
end

#each_with_index_example



original_arr = [1,2,3,4,5,6,7,8,9,10]
new_arr = []

new_arr = original_arr.map {|nums|nums + 2}


p original_arr
p new_arr






















