
 def when_str_are_not_the_same_sorted(str1, str2)
   neither_contain_str_one = str1.chars.select {|l| !str2.include?(l)}
   neither_contain_str_two = str