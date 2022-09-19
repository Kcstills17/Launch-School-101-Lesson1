


def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

 loop do

  puts "please enter a positive or negative integer"

integer_check1= gets.chomp
pos_neg_check1 = integer_check1.to_i

  puts "please enter a positive or negative integer"
integer_check2= gets.chomp
pos_neg_check2 = integer_check2.to_i

   if pos_neg_check1 > 0 && pos_neg_check2 > 0
      puts "both cannot be positive. Must be postiive and negative ints."
   elsif pos_neg_check1 < 0 && pos_neg_check2 < 0
      puts "both cannot be negative. Must be positive and negative ints."
   end

   if  valid_number?(integer_check1) == true && valid_number?(integer_check2) == true
    puts "#{pos_neg_check1} + #{pos_neg_check2} = #{pos_neg_check1 + pos_neg_check2}"
    break
   else
  puts "Invalid input. Only non-zero integers are allowed."
   end


 end
