#What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.
=begin
1. Using OOP we can use code to represent real world objects and represent ideas and social constructs (e.g. a bank account, or an email)
2. We can build our programs using real world approaches to relationships between objects.
  e.g. if we wanted to create a program that represented a library. We could use OOP concepts to represent the relationship
  between the library and the books, the library and the employees, the library and the customers, etc.
3. We can prevent data from being unnecessarily accessible to every part of our code. And allow Sensitive data to be protected.
4. We can use classes to store the behavior of objects and then create instance variables to store their state. Classes also represent a blueprint for an object
  so always have the ability to represent new object's under a similar vein.
5. Along the lines of point 2 classes can inherit behaviors from one another and objects of  classes can collaborate withe one another. These relationships allow for
  natural interactions bewteen code similar to that of real world behaviors.
=end


class Greeting
  def greet(message)
    puts message
  end


end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    greeting = Greeting.new
    greeting.greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#What happens in each of the following cases:

#case 1:

hello = Hello.new
hello.hi

# local variable hello initialized from Hello class
# instance method hi is invoked on instance variable hello
# hi method calls on class Greeting method greet. and since Hello inherits from Greeting it has access to that method
# greet takes one argument and prints it so the result will be 'Hello"

#case 2:

hello = Hello.new

begin
  hello.bye
rescue => exception
  puts "case 2: Hello and Goodbye Classes cannot interact as they just both inherit from Greeting"
else
end

#local variable hello created from Hello constructor
# the instance method bye which is from the class Goodbye is invoked on hello
# This will cause an error as Goodbye and Hello have no interaction with each other currently. They both
# just inherit from Greeting. This means Hello objects have no way to use Goodbye behaviors


#case 3:

hello = Hello.new

begin
  hello.greet
rescue => exception
  puts "case 3: this will cause an error because greet requires an argument and all Hello instances currently have no argument"
else
end

#hello local variable created from Hello constructor
# Greeting behavior greet is invoked on hello.
# the Hello class does inherit from Greeting so this method can be called. However there is an issue
# the greet behavior requires an argument. The way this is setup the only way that greet can properly be called on a Hello class is to
# first invoke the hi method. Which is simply calling the greet method with an argument

#case 4:

hello = Hello.new
hello.greet("Goodbye")

# hello local variable created from Hello constructor
#  Greetings method greet, whicih is accessible because Hello inherits from Greeting is invoked on hello
# in this case the required argument is in place and here it is "Goodbye". This should print "Goodbye"

#case 5:
begin
  Hello.hi

rescue => exception
  puts "case 5: Here an instance method or behavior is being called on the class object Hello itself. This will not work and will cause an error"
else

end


#If we call Hello.hi we get an error message. How would you fix this?
# add a class method for hi in Hello. Within this class method create a new instance of Greeting. Then call greet on the instance method with 'hello' as the argument

Hello.hi


#Question 3

#When objects are created they are a separate realization of a particular class.

#Given the class below, how do we create two different instances of this class with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

star = AngryCat.new(5, 'star')
boots = AngryCat.new(3, 'boots')
p star
p boots


#Question 4

#Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a tabby cat"
  end
end

#How could we go about changing the to_s output on this method to look like this:
 #I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

 tabby = Cat.new('tabby')
 puts tabby.type



 #Question 5

#If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

#What would happen if I called the methods like shown below?

tv = Television.new
# locali variable tv is created from Television constructor
begin
  tv.manufacturer
rescue => exception
  puts "tv.Manufacture: can't call a class method on an instance of a class"
end


# would return an error as this is a class method and tv refers to an instance of Television
tv.model
# would return result of model instance method/behavior

Television.manufacturer
# would return result of manufacuturer class method
begin
  Television.model
rescue => exception
  puts "Television.model: can't call an instance method on a class"
end
# would return an error as an instance method is being called on the Class Television.


#Question 6

#If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

#In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?
# we can use the instance variable age that we have already initialized in the constructor. and increment by one in the make_one_year_older instance method
sally = Cat.new('orange')
p sally.age
p sally.make_one_year_older



#Question 7

#What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end


fluorescent_light = Light.new('high', 'blue ')
p fluorescent_light

# the return statement in the class method information. The last line is automatically returned


str =
