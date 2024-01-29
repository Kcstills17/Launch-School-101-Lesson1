=begin


You are given a string s made up of substring s(1), s(2), ..., s(n) separated by whitespaces. Example: "after be arrived two My so"
Task

Return a string t having the following property:

length t(O) <= length t(1) >= length t(2) <= length t(3) >= length t(4) .... (P)

where the t(i) are the substring of s; you must respect the following rule:

at each step from left to right, you can only move either already consecutive strings or strings that became consecutive after a previous move.
 The number of moves should be minimum.
Let us go with our example:

The length of "after" is greater than the length of "be". Let us move them ->"be after arrived two My so"

The length of "after" is smaller than the length of "arrived". Let us move them -> "be arrived after two My so"

The length of "after" is greater than the length of "two" ->"be arrived two after My so"

The length of "after" is greater than the length of "My". Good! Finally the length of "My" and "so" are the same, nothing to do. At the end of the process,
   the substrings s(i) verify:

length s(0) <= length s(1) >= length s(2) <= length s(3) >= length (s4) <= length (s5)

Hence given a string s of substrings s(i) the function arrange with the previous process should return a unique string t having the property (P).

It is kind of roller coaster or up and down. When you have property (P), to make the result more "up and down" visible t(0), t(2), ...
will be lower cases and the others upper cases.

arrange("after be arrived two My so") should return "be ARRIVED two AFTER my SO"

P
Explicit:
- we are given an input string. the string has substring and is separated by whitespace
-  we are to rearrange the substring to match this format. We are comparing based on substring length
- str(0) <= str(1) >= str(2) <= str(3) >- str(4)...
- once all substring have been rearranged each substring at even positions shall be lowercase and substring at odd index positions shall be uppercase.


implcit:
- when the index of the substring is even then that substring should be <= the substring at the  next index. Vice versa when the substring index  is odd

data structure:
-input is str
- output is str
- we need to iterate through substring and keep up with each index. THis is a good usage for an array.

Algo:
initialize input_arr to the result of splitting the input arr
- we need to loop through and perform the switching actions that are neccessary depending on what the current index will be. However we need to have some condition
- that decides how many times we loop. If we simply loop through once. Although we will swap some possible elements. There may need to be more switching done
- we should use the condition that if all elements at the even index are <= than the index += 1 and all elements at the odd index are >= index += 1 except at the last iteration.

- We can call this correct_substring?
- until correct_substring? iterate through the arr and get each substring and each index
- when the index is even then switch the position of the substring at the current index with the next index if it > then that value : otherwise leave as be
- when the index is odd then perform the same action when the current substring is less than the substring at the next increment index position
- for both cases skip the final index position
- convert all even substring to dowwncase and all odd substring to upcase and join. Return this result

- for correct_substring? we need to compare similar logic as prior. however instead of actually swapping positions we are just checking if they are in the right spot
  - given the same input iterate through an array of all substrings and get each char and index and check that all fulfill this condition
  - if even
  - that the substring at the current position is less than or equal to the substring at the next index position (unless it is the last posiiton, then skip )
  - else
  - that the substring at the current position is >- to the substring at the next index_position (unless it is the last positoin, then skip )
  - When skipping it is important in borh to return true in that instance.

  - create a method that converts all even substrings to downcase and all odd elements to upcase.
=end


def correct_substring?(input_arr)
 input_arr.each_with_index.all? do |substring, i|
  next true if i + 1 == input_arr.size
    if i.even?
       substring.size <= input_arr[i + 1].size
    else
      substring.size >= input_arr[i + 1].size
    end
end

end

def upcase_downcase(arr)
  arr.map.with_index {|words, i| i.even? ? words.downcase : words.upcase }
end

def arrange(str)
input_arr = str.split
until correct_substring?(input_arr)
 input_arr.each_with_index do |substring, i|
  next if i + 1 == input_arr.size
  if i.even?
    substring.size <= input_arr[i + 1].size ? substring : (input_arr[i], input_arr[i + 1] = input_arr[i + 1], input_arr[i])
  else
    substring.size >= input_arr[i + 1].size ? substring : (input_arr[i], input_arr[i + 1] = input_arr[i + 1], input_arr[i])
  end
end
end
 arranged_str = upcase_downcase(input_arr).join(" ")
end
 p  arrange("who hit retaining The That a we taken") ==  "who RETAINING hit THAT a THE we TAKEN" # 3
 p arrange("on I came up were so grandmothers") ==  "i CAME on WERE up GRANDMOTHERS so" # 4
 p arrange("way the my wall them him") == "way THE my WALL him THEM"
 p arrange("turn know great-aunts aunt look A to back") ==  "turn GREAT-AUNTS know AUNT a LOOK to BACK"


# 2. Description
=begin
Middle Earth is about to go to war. The forces of good will have many battles with the forces of evil. Different races will
 ----certainly be involved. Each race has a certain worth when battling against others. On the side of good we have the following races, with their associated worth:

Hobbits: 1
Men: 2
Elves: 3
Dwarves: 3
Eagles: 4
Wizards: 10

On the side of evil we have:

Orcs: 1
Men: 2
Wargs: 2
Goblins: 2
Uruk Hai: 3
Trolls: 5
Wizards: 10

Although weather, location, supplies and valor play a part in any battle, if you add up the worth of the side of good and compare
it with the worth of the side of evil, the side with the larger worth will tend to win.

Thus, given the count of each of the races on the side of good, followed by the count of each of the races on the side of evil, determine which side wins.
Input:

The function will be given two parameters. Each parameter will be a string of multiple integers separated by a single space.
 Each string will contain the count of each race on the side of good and evil.

The first parameter will contain the count of each race on the side of good in the following order:

Hobbits, Men, Elves, Dwarves, Eagles, Wizards.

The second parameter will contain the count of each race on the side of evil in the following order:

Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.

All values are non-negative integers. The resulting sum of the worth for each side will not exceed the limit of a 32-bit integer.
Output:

Return "Battle Result: Good triumphs over Evil" if good wins, "Battle Result: Evil eradicates all trace of Good" if evil wins,

    battle Result: No victor on this battle field" if it ends in a tie.
P:
Explicit:
There are two sides, good and evil. There are 6 good races and 7 evill races.
- Each race has its own worth that will be used for deciding which side will win.
- There are two inputs. Both are strings of integers separated by commas, the integers for the first input is for the good races and the second for the evil.
- The order for the good integers is as following Hobbits, Men, Elves, Dwarves, Eagles, Wizards.
- The order for the evil ints is as following Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.
- All values are non negative ints
- The total sum of all values shall not surpass the limit of a 32 bit integer.
-  Return "Battle Result: Good triumphs over Evil" if good wins, "Battle Result: Evil eradicates all trace of Good" if evil wins,
- battle Result: No victor on this battle field" if it ends in a tie.


Data structure:
input: two string containing integers
output: a string that shows which side won or  it there was a tie.
Intermediary structure: a hash to link each integer with a race.

Algorithm:
-create 2 different hashes, good_hsh and evil_hsh, each key will repredsent simply the order of the raced or the index place.
- The value shall be an array that contains the worth of the race in a 0 as a placeholder for the number of that race
-iterate through the array and get each char and index.
- access the hash at the currernt index and convert the last value of the array in both hashes to the current char.
- exit the loop and set good_value to the result of adding all last indexes of the hsh values. do the same for the evil_hsh
- create helper methods for the output, how to add up the hash values, and how to change the hash values.

Implicit:

=end
def change_value(hsh, str)
   str.split(" ").each_with_index {|char, i | hsh[i][-1] = char.to_i}
  end

 def  sum_of_hash_values(hsh)
  hsh.values.map {|a| a.reduce(&:*)}.sum
 end

 def output_result(good_val, evil_val)
  if good_val > evil_val
     "Battle Result: Good triumphs over Evil"
  elsif good_val < evil_val
     "Battle Result: Evil eradicates all trace of Good"
  else
     "Battle Result: No victor on this battle field"
  end
 end


def good_vs_evil(good_str, evil_str)
  good_hsh = {0 =>  [1, 0] , 1 => [2, 0], 2 => [3, 0], 3 => [3, 0], 4 =>  [4, 0], 5 => [10, 0]}
  evil_hsh = { 0 => [1, 0], 1 => [2, 0] , 2 => [2, 0], 3 => [2, 0], 4 => [3, 0], 5 => [5, 0],  6 => [10, 0]}
  change_value(good_hsh, good_str)
  change_value(evil_hsh, evil_str)

  good_result = sum_of_hash_values(good_hsh)
  evil_result =  sum_of_hash_values(evil_hsh)
  output_result(good_result, evil_result)

end



p good_vs_evil('1 0 0 0 0 0', '1 0 0 0 0 0 0') == "Battle Result: No victor on this battle field"
p good_vs_evil('0 0 0 0 0 10', '0 1 1 1 1 0 0') == "Battle Result: Good triumphs over Evil"
p good_vs_evil('0 0 0 0 0 10', '0 1 1 1 1 0 0') == "Battle Result: Good triumphs over Evil"


def iterate(arr)
  for element in arr
    yield element
  end
end

def count_zeros(arr)
  counter = 0
  iterate(arr) do |element|
    counter += 1 if element == 0
  end
  counter
end

puts count_zeros([1, 2, 0, 3, 0, 4])
