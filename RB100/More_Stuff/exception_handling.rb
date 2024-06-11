# Exception handling is a specific process that deals with errors in a manageable and predictable way.
#The main thing we want to make you aware of at this point, is how exception handling works and what it looks like.
#The reserved word rescue will show up a lot in your Ruby career so it's better to know what it is sooner than later.


#exception_example

names = ['bob', 'joe', 'steve', 'tom', nil]

names.each do |name |
  begin
    p#uts "#{name}'s name has #{name.length} letters in it "
  rescue
    #puts "ABORT ABORT!!!"
  end
end



#inline exception example
zero = 0;
#puts " before each call"
zero.each{|elemment| puts element } rescue #puts "cant do that"
#puts "after each call"


# rescuing code with preexisting errors

def divide(number, divisor)
  begin
    answer = number/divisor
  rescue  ZeroDivisionError => e  # this stores our error in a variable from which we can then access and then use accordingly.
    puts e.message
  end
end

#puts divide(16,4)
#puts divide(4,0)  # normally this would halt the program, but due to the exception we have created it allows us to display the rest of the program.
#puts divide(14, 7)


# parsing through excpetion errors

def greet(person)
 # puts "hello " + person
end

greet("john")

greet(1)

# A large part of understanding errors comes from understanding the stack trace.  In this case it would run like this
# main -> greet -> puts -> exit and return to main
# The stack trace first tells us where the error occurred and why: line 2 of greeting.rb, and the error was because the types don't match.
 # The error occured due to the call made in the 'main' context on line 6, which contains the line that called the method with incorrect arguments, line 2.


 def space_out_letters(person)
  begin
    puts person.split("").join("")
  return person.split("").join("")
  rescue => e
    puts "space_out_letters failed" # We can even say which method failed at the point that it did fail.
    #puts "Error Message : #{e.class}"  # cool examples of using error methods to access information about our errors.
    #puts "Error Message : #{e.message}"
    #puts "Error Message : #{e.backtrace}"

  end
 end

 def greeting(person)
  begin
  return "H e l l o ," + space_out_letters(person)
  rescue => e
    puts "greeting failed "
    #puts "Error Message : #{e.class}"
    #puts "Error Message : #{e.message}"
    #puts "Error Message : #{e.backtrace}"
  end
 end

 def decorate_greeting(person)
  begin
  puts "" + greeting(person) + ""
  rescue => e
    puts "decorate_greeting failed "
    #puts "Error Message : #{e.class}"
    #puts "Error Message : #{e.message}"
    #puts "Error Message : #{e.backtrace}"
  end
 end

 decorate_greeting("john")
 decorate_greeting(1)





