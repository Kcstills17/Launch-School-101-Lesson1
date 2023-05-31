#1.Banner Class
  #Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line , empty_line , horizontal_rule ].join("\n")
  end

  private

  def horizontal_rule
    '+' + '-' * (message_line.size -  2) + '+'
  end

  def empty_line
    "| #{' ' * (@message.size)} |"
  end

  def message_line
    "| #{@message} |"
  end
end

#Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need.
  #However, do not make the implementation details public.
  #You may assume that the input will always fit in your terminal window.

#Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
 banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end
banner = Banner.new('')
 banner
=begin
+--+
|  |
|  |
|  |
+--+
=end



#2. What's the Output?

#Take a look at the following code:

class  Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
fluffy
name += 1
fluffy


#What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.
# it looks like the to_s method is not printing the full statement that we want to return when using puts name
# for this extra example none of these objects that we are accessing are the same.
# on line 71 local variable name is initialized to integer 42
# on line 72  instance variable  fluffy is instantiatied with name as an argument
# within our initialize method in the Pet class our passed in argument is converted into a str.
# at this point name and our argument no longer point to the same object. Therefore when name is incremented it has no affect on fluffy.

=begin
#3. Fix the Program - Books (Part 1)
#Complete this program so that it produces the expected output:

class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

 book = Book.new("Neil Stephenson", "Snow Crash")
 puts %(The author of "#{book.title}" is #{book.author}.)
 puts %(book = #{book}.)

#Expected output:

#The author of "Snow Crash" is Neil Stephenson.
#book = "Snow Crash", by Neil Stephenson.


# there was no way to get the instance objects. So by using attr_reader we are able to access them and print the accurate statements.


#Further Exploration

#What are the differences between attr_reader, attr_writer, and attr_accessor?
# attr_reader allows for  getter methods to occcur. This means when we would want to access our code through ways like print methods it is possible
# attr_writer allows for setter methods to occur. So if we would like to change a current instance_variable we are allowed so
# attr_accessor allows for both

#Why did we use attr_reader instead of one of the other two? Would it be okay to use one of the others? Why or why not?
# in this case attr_writer would not work as we are attempting to print the instances of title and author from book. This would not allow it
# attr_accessor would work. Although it is not necessary for this implementation.


=end

#4. Fix the Program - Books (Part 2)
  #Complete this program so that it produces the expected output:

class Book
attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
 %(The author of "#{book.title}" is #{book.author}.)
 %(book = #{book}.)

#Expected output:

#The author of "Snow Crash" is Neil Stephenson.
#book = "Snow Crash", by Neil Stephenson.



#5.Fix the Program - Persons
  #Complete this program so that it produces the expected output:

class Person

  attr_writer :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
 person

person.first_name = 'jane'
person.last_name = 'smith'
person

#Expected output:

#John Doe
#Jane Smith



#6.Fix the Program - Flight Data
  #Consider the following class definition:

#class Flight


  #def initialize(flight_number)
  #  @database_handle = Database.init
  #  @flight_number = flight_number
  #end
#end

#There is nothing technically incorrect about this class, but the definition may lead to problems in the future.
#How can this class be fixed to be resistant to future problems?
# delete the attr_accessor so there is no longer easy access to it

#plane = Flight.new(22)



# 7. Buggy Code - Car Mileage
#Fix the following code so it works properly:

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    #puts mileage
  end
end

car = Car.new
car.mileage = 5000
 car.increment_mileage(678)
car.print_mileage  # should print 5678

#we need in increment_mileage to access the instance mileage so we can either use self.mileage without the instance method or we can use @mileage to access it as well. Without
# that we are instead creating a local variable mileage that is not the same as our instance @mileage. However it is better practice to access self within the instance
# method as bypassing the instance method with @ could cause unintentional problems outside of the method.




#8. Rectangles and Squares

#Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side)
    super(side, side)
  end
end

#Write a class called Square that inherits from Rectangle, and is used like this:

square = Square.new(5)

 "area of square = #{square.area}"

# we use a different number of parameters to match our input. we use super to inherit the same functionality from our higher class Rectangle and then pass in side
# twice to function as sboth the height and width.




#9.Complete the Program - Cats!
#Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age

  end
end

class Cat < Pet
  def initialize(name, age, colors)
    super(name, age)
    @colors = colors
  end
  def to_s
    "My cat #{@name} is #{@age} and has #{@colors} fur"
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

#Update this code so that when you run it, you see the following output:

#My cat Pudding is 7 years old and has black and white fur.
#My cat Butterscotch is 10 years old and has tan and white fur.


# the cat class has a different amount of arguments then the inherited Pet class. So we must instantiate a new initialize method with the correct num of paramaters
# we can inherit name and age from Pet using super and instantiate colors as the new parameter
# now we just need a to_s method to print out what we want we the puts method is invoked on the instance variables.



#10. Refactoring Vehicles
#Consider the following classes:
=begin
class Car
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    4
  end

  def to_s
    "#{make} #{model}"
  end
end

class Motorcycle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    2
  end

  def to_s
    "#{make} #{model}"
  end
end

class Truck
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    @make = make
    @model = model
    @payload = payload
  end

  def wheels
    6
  end

  def to_s
    "#{make} #{model}"
  end
end
=end
#Refactor these classes so they all use a common superclass, and inherit behavior as needed.


class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    self.class::WHEEL_COUNT
  end

  def to_s
    "#{make} #{model}"
  end
end

class Cars < Vehicle
  WHEEL_COUNT = 4
end

class Motorcycle < Vehicle
  WHEEL_COUNT = 2
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  WHEEL_COUNT = 6
end



honda = Cars.new('civic', 2018)
puts honda
cycle = Motorcycle.new('Harley', 1997)
puts cycle
truck = Truck.new('silverado', 2017, 2)
puts truck.wheels
puts cycle.wheels
puts honda.wheels
# bonus: instead of getting rid of the base clase wheels and having each subclass wheels method override that one. We can create a single wheel method in the base class
  # and in that method access the constant NUM_WHEELS in self which will set NUM_WHEELS to it's respective wheel count in the class.


  str = 'doug'

  result = 'doug will be the one and true match'
  p result.match(/#{str}/)
