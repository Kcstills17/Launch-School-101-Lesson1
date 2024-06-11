def sum_pairs(arr, int)
  seen = {}
  arr.each_with_index do |num, i|
     complement = int - num
     seen[complement]
      [complement, num]
    if seen[complement]

      return [complement, num]
    end
   seen[num] = true
  end
  nil
end