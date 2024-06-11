arr = [1,2,3,4]

 method_result = arr.each do |num|
   num += 1
 end

p arr
p method_result
p arr.object_id
p method_result.object_id
# on the first p of the arr we have an initiallized variable arr which we contains 4 integer objects
# initiallize method_result and set to result of block
 # we iterate through arr with the each method which returns the same object that it is called upon and
# ignores the return value of the block
# within the block we increment num which is each iteration of arr by 1 and set as new value
# that result is implicitly returned within the block
# results with each being called

# p arr => [1,2,3,4]
# p method_result => [1,2,3,4]
# arr.object_id => 60
# method_result.object_id => 60
# as shown the method_result ignores the block return value and returns self and each is returning the same object as the original variable



method_result = arr.map do |num|
  num += 1
end

p arr
p method_result
p arr.object_id
p method_result.object_id

# now let's see with map being used instead
# same arr initiallization as before
# initiallize method_result and set to result of block
# we iterate through arr with the map method which transforms each iteration of arr onto a new array
# these are reflected with num within our block
# the result of  num += 1 is applied to each num and implicitly returned
# map reflects the return value of  the block
# results of map being used

# p arr = > [1,2,3,4]
# p method_result => [2,3,4,5]
# arr.object_id  => 60
# method_result.object_id => 80

# You can see here that method_result has reflected the return value of the block and is pointing towards a separate address in memory than out original variable arr


method_result = arr.select do |num|
  num += 1
end

p arr
p method_result
p arr.object_id
p method_result.object_id


# with select being used
# method_result is initiallized to the result of out block
# select is invoked onto arr which creates a new arr (because select creates a copy of whatever data structure is the original object)
# and the result of this is returned in each iteration as num
# num += 1 is the last line and is implictly returned within the block
# select looks for all truthy values to return
# in this case each num will evaluate as truthy as only nil and false are falsy values
# therefore the method returns each num due to them being truthy
# the result of num += 1 is not taking into account because select is only evaluating for truthiness
# results of select

#  p arr => [1,2,3,4]
#  p method_result => [1,2,3,4]
# p arr.object_id => 60
# p method_result.object_id => 100

# as expected method_result evalauates all num as truthy and return those onto a new array
