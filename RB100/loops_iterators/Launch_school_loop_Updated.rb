loop do # outer loop so we can break out of initial first loop and still be required to break out.
number_of_lines = nil
escape_loop = nil # create another variable but this time it will represent gets as a string. specifically if its 'q'

loop do
  puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit):"
  escape_loop = gets.chomp  #change original gets number_of_lines to escape_loop


  number_of_lines = escape_loop.to_i  #make number_of_lines = escape_loop.to_i
  break if escape_loop == 'q' || escape_loop == "Q"   #now we create our condition for escaping with q. It is important to note this will allow us to exit this loop. but not
                                                      # the entire loop

  break if number_of_lines >= 3        # continue with same code as before
  puts ">> That's not enough lines."
end
break if escape_loop == 'q' || escape_loop == "Q"  # Once again post the same break logic for the outer loop so we can escape here.

while number_of_lines > 0
  puts 'Launch School is the best!'         #continue on with previous logic
  number_of_lines -= 1
end

end    #now we can escape either loop with 'q' or "Q" and still print the same values as before. Nice!
