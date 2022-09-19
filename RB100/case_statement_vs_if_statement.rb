
stoplight = ['green', 'yellow', 'red'].sample
=begin
case stoplight
when 'green' then puts "Go!"
when 'yellow' then puts "Slow down!"
when 'red' then puts "Stop!"
end
=end



if stoplight == 'green'
  puts 'Go!'
elsif stoplight =='yellow'
  puts "Slow down!"
else
    puts "Stop!"
end


#in this case it's more concise and optimal to use a case statement.
