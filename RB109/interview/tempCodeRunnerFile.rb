def when_has_special_char(str)
  letters = ('a'..'z').to_a
  chopped_arr = str[1..-2].chars
  special_character_and_position = []
  chopped_arr.each_with_index {|l, i|special_character_and_position << l if !letters.include?(l) && special_character_and_position << i if !letters.include?(l) }
  chopped_arr.delete(special_character_and_position[1])
  sorted_arr = chopped_arr.sort {|a, b| a <=> b}
  unfinished_arr = sorted_arr.insert(special_character_and_position[0], special_character_and_position[1])
  unfinished_arr = sorted_arr.unshift(str[0]) && sorted_arr << str[-1]
  result_str = unfinished_arr.join
end
