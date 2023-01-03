arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
arr2.map! do |letter|
  letter.capitalize
end
p arr1
p arr2
