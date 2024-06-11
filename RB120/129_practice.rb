#2 — Define a class of your choice with the following:
=begin
  Constructor method that initializes 2 instance variables.
  Instance method that outputs an interpolated string of those variables.
  Getter methods for both (you can use the shorthand notation if you want).
  Prevent instances from accessing these methods outside of the class.
  Finally, explain what concept(s) you’ve just demonstrated with your code.
=end
require 'pry'


class Snake
  def initialize(species, venomous)
    @species = species
    @venomous = venomous
  end

  def details
    puts "this snake is a #{species} and is it venomous? #{venomous} "
  end

  private
  attr_reader :species, :venomous
end

cobra = Snake.new('Cobra', 'yes')
python = Snake.new('Python', 'no')
 python.details
 cobra.details

=begin
  I believe the main concept demonstrated here is encapsulation. a group of states and behaviors is encapsulated in the Snake class.
  each instance creates it's own copy of each instance variable upon instantion.
  Method Access Control is also at play. The getter methods for both instance variables is set to private. Meaning that they are not accessible
  outside of self instance methods. This is intentional  as the only time here when we want someone to be able to see the values of species or venomous
  is when the details method is invoked.
=end




#3 — What concept does the following code aim to demonstrate?

module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"


=begin
  This example shows Polymorphism through interface inheritance. We are able to use or Module Greet and mixin it's method greet in the classes Teacher and Student
 borth teahcer and student share this common behavior but they express them in a different way. because of that we use a module. Here two objects of different types are
 able to respond to the same method in a different way.
=end


#4 — What will the last line of code return?
class Student
  def initialize(id, name)
    @id = id
    @name = name
  end

  def ==(other)
    self.id == other.id
  end

  private

  attr_reader :id, :name
end

rob = Student.new(123, "Rob")
tom = Student.new(456, "Tom")

#rob == tom


=begin
  A NoMethodError will occur  in our == instance method. This is because the getter for our id instance variables has been set to private.
  This means nothing other than self can be invoked on id. This is no problem in the left side with self.id however the exception will occur
  when other is invoke on id. Somethind other than self.
=end

#5 — What will the last 2 lines of code output?
=begin
class Foo
  def self.method_a
    "Justice" + all
  end

  def self.method_b(other)
    "Justice" + other.exclamate
  end

  private

  def self.all
    " for all"
  end

  def self.exclamate
    all + "!!!"
  end
end

foo = Foo.new
puts Foo.method_a
puts Foo.method_b(Foo)
=end
=begin
  for the line  puts Foo.method_a we look into the method_a method. We can see it is a class method with the self  before the method name. In the class method
  the string "Justice" is added to the variable all. At this point we don't know what all is so lets look into the class.
  Further down we see another class method all with the self moniker. This prints " for all". Therefore since we have a class method that is adding string to the result of another
  class method that is string. we return "Justice for all"
  for the second line. the same logic applies.
  end
end
=end

#6 — Will the following code execute? What will be the output?

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
     "Hello! they call me #{name}"
  end
end

class Puppet < Person
  def initialize(name)
    super
  end

  def greet(message)
    puts super() + message
  end
end

puppet = Puppet.new("Cookie Monster")
puppet.greet(" and I love cookies!")

=begin
  The code does not run. This is a result of within the greet(message) method in Puppet. super is being called without arguments + message which is a str argument.
  The problem is when super is invoked without () it checks within the current class to see if there is a greet message without an argument. There is not so it
  moves up the hierarchical chain to the Person class to where it does find a greet method without arguments. However when greet is invoked on puppet on the final line
  we do have a str argument we intend to pass in. So a simple fix is to modify the line for greet in Puppet to puts super() + message
=end


#7 — What concept does this code demonstrate? What will be the output?

class Bird
  def fly
    p "#{self.class} is flying!"
  end
end

class Pigeon < Bird; end
class Duck < Bird; end

birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)


=begin
  this demonstrates  Polymorhism through Inheritance. The Bird class has a fly method which interpolates the class with 'is flying'
  Pigeon and Duck do not have a fly method of their own but they inherit the method. This displays Inheritance.
  Polymorphism is shown in the last line when an array of 3 different types of objects each have the fly method invoked upon them. This shows different types of data
  responding to the same interface in different ways.
=end


#8 — What does the self keyword refer to in the good method?

class Dog
  attr_accessor :name

  def good
    self.name + " is a good dog"
  end
end

bandit = Dog.new
bandit.name = "Bandit"
p bandit.good


=begin
self refers to the copy of the instance variable that the current object has access to. In this example bandit is set to a new instance of Dog
when good is invoked on bandit it will print "Bandit" which is the current copy of the name instance variable + "is a good dog "
=end


#9 — What will the last three lines of code print to the console? After song.artist is called, what would be returned if we inspect the song object?

class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
    @artist
  end

  def artist=(name)
    @artist = name.upcase
  end
end

 song = Song.new("Superstition")
 song.artist = "Stevie Wonder"
 song.artist



=begin
Class name followed by the id of the hexadecimal id of the object
Initialized instances followd by their values.
#<Song:0x00005587e7722a08 @title="Superstition">
"Stevie Wonder"
"STEVIE WONDER"
#<Song:0x00005630e92eefd0 @title="Superstition", @artist="STEVIE WONDER">

in our initialize method @artist is instantiated but not to any value. So when you inspect song @artist will not show. However the instance does exist. It has just not been set
yet. And if you were to inspect song.artist before setting the value through the use of the setter method nil will be returned. After the setter method is used
"STEVIE WONDER" is shown as the value of the @artist state.
=end


#10 — What will the last 2 lines output in this case?

class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
  end

  def artist=(name)
    @artist = name
    name.upcase!
  end
end

song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist


=begin
same as before except for one key distinction. The first song.artist being printed will return "STEVIE WONDER" as the object that the past in object points to has been
mutated. the final song.artist will be "STEVIE WONDER" as well however for a slightly different reason. the instance variable @artist is set to the object that name points to
and since that object is mutated @artist is affected by the change as well.
=end


#11 — What would cat.name return after the last line of code is executed?

class Cat
  attr_accessor :name

  def set_name
    name = "Cheetos"
  end
end

cat = Cat.new
p cat.set_name
p cat

=begin
cat.name would return nil since line 5 is simply local variable initialization.
In setter methods, it is important to be explicit by prepending @ or self. to the instance variable name to disambiguate it from local variable initialization.

=end


#12 — What will the last two lines of code output?

module Walk
  STR = "Walking"
end

module Run
  STR = "Running"
end

module Jump
  STR = "Jumping"
end

class Bunny
  include Jump
  include Walk
  include Run
end

class Bugs < Bunny; end
# Bugs, Bunny, Run, Walk, Jump, Object PP::ObjectMixin, Kernel, BasicObject
#Subclass, Superclass, Modules, built-in Objects

p Bugs.ancestors
p Bugs::STR
# Running. The last included module is the constant that will be referred to


#13a — What will be returned by the value1 and value2 method calls?
#13b — If we omit the first line (VAL = ‘Global’), what will the returned values be then?
#13c — Without defining VAL again, what line of code can you add to the Bar class inside the Foo module to allow value2 access to the same VAL as value1?


#AL = "Global"

module Foo
  VAL = 'Local'

  class Bar
    include Foo
    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end

p Foo::Bar.new.value1
#a. local. Lexical scoping. Foo:Bar.new.value1 searches from the current referencing container, which is the module foo in this case. VAL refers to the str 'local'
#b. same as before
p Foo::Bar.new.value2
#a. 'global' lexical scoping. It checks the current reference container which is Foo:Bar. It then checks the hierarchy chain which there is none here and then it checks
# main scope. Which it finds VAL = "Global"
#b. An error will be raised as there is nothing in the main scope for it to find

#c When you use the syntax class Foo::Bar, you are defining a new class called Bar that is inside the Foo module.
#However, this does not automatically give the new Bar class access to the constants defined inside the Foo module.
#To give the new Bar class access to the constants defined inside the Foo module, you would need to include a line
#like this inside the Bar class definition:


#14 — Write 3 methods inside the Person class and one method in the Friend class that would return the outputs shown on lines 23 and 24.



class Person
  attr_reader :friends

  def initialize
    @friends = []
  end

  def <<(friend)
    self.friends << friend
  end

  def []=(index, friend)
    friends[index] = friend
  end

  def [](index)
    friends[index]
  end


end

class Friend
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

tom = Person.new
john = Friend.new('John')
amber = Friend.new('Amber')
tom << amber

puts tom.friends
tom[1] = john
#p  tom.friends.map {|friend| friend.name}
puts tom.friends
puts tom[0]      # => Amber
#puts tom.friends # => ["Amber", "John"]


#15.

#15 — What will be output when the last 2 lines of code get executed?

class Loo
  @@var = 1

  def self.var
    @@var
  end
end

class Bar < Loo
  @@var = 2
end

puts Loo.var
puts Bar.var


=begin
put print 2. This shows the danger of using class methods through inheritance. Most of the time the intended use is not to have the class variables affect other class variables
but here with inheritance it does. Bar inherits from Loo and it has set @@var to 2. since this is the same class variable from Loo @@var that was initally set to 1
is set to 2 as well when you puts Loo.var.
=end



#16 — Update the Human class to have lines 11 and 14 return the desired output.


class Human
  attr_reader :name
  @@name = "Dylan"
  @@color = "Blonde"
def initialize(name="Dylan")
  @name = name
end

def hair_color(color = 'blonde')
  "Hi. my name is #{name} and I have #{color} hair"
end

def self.hair_color(color = 'blonde')
  "Hi. my name is #{@@name} and I have #{@@color} hair "
end

end
puts Human.new("Jo").hair_color("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_color("")
# Should "Hi, my name is Dylan and I have blonde hair."


#17 — What does each self refer to in the code snippet below?


class MeMyselfAndI
  self
 # class

  def self.me #class
    self
    #class
  end

  def myself
    binding.pry
    # instance
  end
end

i = MeMyselfAndI.new




# What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?
class Shape

  def self.sides
    self::SIDES
  end

  def sides
    binding.pry
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

module Describable
  # SIDES = 5
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end

  class Test < Quadrilateral
    # include Describable
    # SIDES = 2

    def sides_const
      SIDES
    end
  end
end

# p Square.sides # => 4
 p Square.new.sides # => 4
# p Square.new.describe_shape # error thrown
#p Describable::Test.new.sides_cons
