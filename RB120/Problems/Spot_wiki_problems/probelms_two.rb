require "pry"

#21.  What is the difference between instance methods and class method

# A class method refers to a method that can be invoked on the class itself. It is defined using the `self` key word before a method.  e.g.

class Class
  def self.look
    p "A class method is being invoked on me the #{Class} class "
  end
end

Class.look

# An instance method refers to a method that is invoked on a particular object of the given class. different objects of the same class can respond to this. These methods do
# use self when defining the method.



class Instance
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def look
    p "a method is being invoked on this instance #{name}"
  end
end


john = Instance.new('john')
sally = Instance.new('sally')
john.look
sally.look


#22 What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.

# A Collaborator objects is when one object's relationship with anothe object is a `has-a` relationship.
# for example if we have a `Shelf` class and we also have a `Manga` class. Through a public interface if we were to send a Manga object to be stored
# in the state of a Shelf Object. That shelf has manga. And therefore these are collaborative objects.


class Shelf
     attr_accessor :row
  def initialize
    @row = []
  end

  def add_to_shelf(item)
    self.row << item
  end

  def to_s
    "#{row.map {|series| series.name}}"
  end


end

class Manga
  attr_accessor :name, :genre

  def initialize(name, genre)
    @name = name
    @genre = genre
  end

  def to_s
    "Series: #{name}, Genres: #{genre}"
  end

end

naruto = Manga.new("Naruto", "Action/Adventure/Fantasy/Shonen")
berserk = Manga.new("Berserk", "Action/Adventure/Horror/Romance/Politics/Fantasy/Seinen")
my_shelf = Shelf.new
 my_shelf.add_to_shelf(naruto)
 my_shelf.add_to_shelf(berserk)
puts my_shelf


#23. How and why would we implement a fake operator in a custom class? Give an example.

# In certain cases there is no defined way for customs class object's to interact in cases. We knew standard method's like + will add together if integers
# and concatenate if str. But what about a custom made class object? It is not designed to implement this. So when a situation like this exists that is the time to
# create a custom method.


class Bear
    attr_reader :name, :type
  def initialize(type, name)
    @type = type
    @name = name
  end

  def ==(other_bear)
    self.type == other_bear.type
  end
end


bruce = Bear.new("Panda", "Bruce")
teddy = Bear.new("Grizzly", "Teddy")
wen = Bear.new("Panda", "Wen")
#p teddy == bruce
 wen == bruce

 # In this case a `Bear` class has been defined and we want to create a custom `==` method that returns true when the state of the `@type` instance variable of an object
 # is equal to the  state of the `@type` instance_variable of our argument Bear object. In this case we can compare each Bear Object instead of having to directly accessing
 # the `@instance variable` of  each particular object.

 #24. What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.

  # Here are the different types of self in Ruby.

  # Instance level Self : When you have an instance method and within the contents of the definition `self` is referred to. This self refers to the current object that
  # is being called.  E.g.

  class Books
    def initialize(name)
      @name = name
    end

    def example
      self
    end

    book = Books.new('Tom Sawyer')
     book.example # => #<Books:0x00005566aa355c80 @name="Tom Sawyer"> returns the class, hexadecimal object_id, the instance variables and the encapulated states.
  end

  # Class level self: when you call self within a class but outside of an instance method or within a class method `self` refers to the class itself.

  class Box
    def self.example
      self
    end
  end

   Box.example # => Box  (returns the class object.)



   # 25.
   class Person
    def initialize(n)
      @name = n
    end

    def get_name
      @name
    end
  end

  bob = Person.new('bob')
  joe = Person.new('joe')

  puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
  puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

  p bob.get_name # => "bob"

   # What does the above code demonstrate about how instance variables are scoped?

   # This code demonstrates that instance variables  are scoped to their given object. for example in this code
   # we have a `Person` class defined.  We instantiate a `@name` instance variable and have a `get_name` method which returns the value of the `@name` state.
   # Desipute get_name being a different method we can still access `@name` for our given object. This clearly shows how instance variables are scoped at the object level.


   #26.  How do class inheritance and mixing in modules affect instance variable scope? Give an example.

   # When a module is mixed in to a base class and then the class attributes are inherited to a subclass, that subclass also has access to those mixed in behaviors.
   # for example

   module Fly
    def enable_flying
      @can_fly = true
    end
   end


   class Bird
    attr_reader :can_fly
    def initialize
      @can_fly
    end
    include Fly
   end

   class Robin < Bird

   end

    bird = Bird.new
    robin = Robin.new
    robin.enable_flying
    robin.can_fly

    # we can see here that we mix in a module that will initialize the @can_fly instance_variable to true. When mixed in to the Bird class it is then available at the
    # object level like a instance variable that was initialized in the Bird class. It is the same case for Robin as well.

    #27. How does encapsulation relate to the public interface of a class?

    #Encapsulation involves creating containers for code, and makes that code
    #unavailable to the public interace. Ruby achieves this by defining classes and
    #instantiating objects of the class. Through the instantiated object we are able
    #to invoke the defined methods in the class. By doing this, methods cannot be
    #invoked and data cannot be manipulated without obvious intention. Encapsulation
    #defines boundaries with our code and the public interface, allowing us to
    #achieve higher levels of complexity, as well as reducing dependencies in our
    #code.


#28.

    class GoodDog
      DOG_YEARS = 7

      attr_accessor :name, :age

      def initialize(n, a)
        self.name = n
        self.age  = a * DOG_YEARS
      end


    end

    sparky = GoodDog.new("Sparky", 4)
    puts sparky

    # What is output and why? How could we output a message of our choice instead?

    # The class, `GoodDog` and  the hexadecimal object is output. To print out an output that would show our `@name` and `@age` values we could create a
    # custom to_s method that would access our getter methods and then interpolate them to the message of our choice.

   # def to_s
   #   binding.pry
   #   "this good dog is named #{name} and he is #{age} years old in dog years."
   # end

# How is the output above different than the output of the code below, and why?


class GoodDogs
  DOG_YEARSS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARSS
  end
end

sparkys = GoodDog.new('sparky', 4)
p  sparkys



# Here line 259 will return the class GoodDog, the hexadecmial id of the object, the states, and the values of each respective state. This is because `p` or the inspect
# method has been invoked on `sparky` instead of `puts` which will just output the class and hexadecimal object_id .


#29. When does accidental method overriding occur, and why? Give an example.

#Accidental overriding occurs when a method is defined in a class with the same name as another method further up the lookup path.

class Colors
  attr_reader :blue
  def initialize
    @color = 'blue'
  end

  def inspect
    puts "this is a #{blue} color"
  end

end

 Colors.new

# in this example we try to define an `inspect` method within a `Colors` class. `inspect` has an important duty which is to provide a string representation of the data
# of objects. Here we want to simply print this simple interpolated string which accesses the getter method of our instance_variable `@blue`. However in this code
# we have overriden the Object#inspect method with our own custom `inspect`. This has lead to problems as now when we try to invoke `inspect` with `p Colors.new`
# our interpolated str `"#{blue}"` no longer works in the way that we would expect it to.

#30. How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

# Method Access control is implemented in a way so that we can reveal functionality of our code to the outside code base when we intend to do so. Lets start with
# when we would want free access to the rest of the code base with public modifiers

class Lizard
  attr_reader :name
  def initialize(name)
    @name = name
  end


  def name=(other_name)
    @name = other_name
  end
end

poncho = Lizard.new("Poncho")
p poncho.name
 poncho.name = 'Drago'
 p poncho.name

 # in this example we have a `Lizard` class which has one instance variable `@name` which is initialized to the passed in parameter when instantiated.
 # local variable `poncho` is assigned to the instantiated `Lizard` object. we first use our getter method to access `@name` and directly print the value.
 # we then use the setter method to directly change the value of `@name` to `"Drago"`. And we then use the getter method to print the changed result of `@name`.

 # here is an exmaple where we don't want to have our code just be easily accessible to the outside code base but we want more than just 1 instance to accessed
 # in a given method

 class Bank_Account
  attr_reader :name
  def initialize(name, savings)
    @name = name
    @savings = savings
  end

  def >(other)
  self.savings > other.savings
  end

 protected
 attr_reader :savings
 end


 chase = Bank_Account.new("Chase", 10000)
 robert = Bank_Account.new("Robert", 2000)
 # chase.savings # => NoMethodError as the getter method for `@savings` is protected and cannot be directly accessed
 p chase > robert #=> true this shows that even though `@savings` is protected and cannot be accessed directly. the custom `>` method can compare two different instances
                      # of thes same class.


# Now let's assume we don't want to share any data to the outside codebase and we want only the particular instance itself to be able to invoke a particular method

class LogOn
  attr_reader :name
  def initialize(name, password)
    @name = name
    @password = password
  end

  def ==(other)
    self.password == other.password
  end

  def confirm_password
    puts "confirm password please"
    answer = nil
    loop do
      answer = gets.chomp
      break if answer.include?(self.password)
      puts "incorrect password "
    end
  end

  private
attr_reader :password
end


sawyer = LogOn.new("Sawyer", '12345')
trace = LogOn.new('Trace', 'LovelyFlower35')
#p trace.password #=> NoMethodError error output because the getter method for  `@password` is set to private and therefore we cannot directly
                    #access the value
#p trace == sawyer #=> NoMethodError. in our custom `==` method we attempt to use two different instances in the method. That is not possible with a private access modifier
                      #only self can be invoked on a given method
#sawyer.confirm_password #=> this code runs the loop as self is the only thing the method is invoked upon.

#31. Describe the distinction between modules and classes.
#Classes:
 #Provide a blueprint for an object of it's class and creates/instantiates new objects.
 # Can use class inheritance  and connect classes through base classes, superclasses, subclasses, etc.
 # can only inherit from 1 single superclass.

 #Modules:
 # Does not create new objects
 # can be mixed in to classes through the use of the `include` invocation.
 # Are not instantiated and do not have their own instance variables
 # can be mixed in to multiple different classes. This is typically to add a common feature that is shared among several classes but not all.


 #32. What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

 # Polymorphism is the ability for different types of objects to interact with the same interface or method and sometimes, but not always, provide a different result.
 # here are the different type of ways to implement polymorphism

 #Polymorphism through inheritance

 class Reptile
  def  motion
    puts "I move around  "
  end
 end

 class Snake < Reptile
  def motion
    puts "I Slither"
  end
 end


 class Gator < Reptile
  def motion
    puts "I Crawl"
  end
 end


 [Reptile.new, Snake.new, Gator.new].map {|animal| animal.motion}


 # Snake and Gator override the base method  motion method and print out new statements. This shows polymorphism through inheritance.

 # Polymmorphism through Modules/Public interfaces


 module Jumpable
  def jump
    puts "I like to jump from time to time "
  end
 end


 class Bunny
  include Jumpable
 end

 class Antelope
  include Jumpable
 end

 class Kangaroo
  include Jumpable
 end

 [Bunny.new, Antelope.new, Kangaroo.new].map {|animal| animal.jump }
# each class had the Jumpable Module mixed in. And therefore had access to the `jump` method.


# Polymorphism through Duck Typing
# a key to Polymorphism with Duck typing is unrelated objects responding to the same interface with intention behind it. If it is by pure coincidence then it
# is not an example of duck typing


class Musician
def play
  puts "I play my musical instrument "
end
end

class Gamer
  def play
puts "I play video games "
  end
end

class Athlete
  def play
  puts "I play sports "
  end
end


[Musician.new, Gamer.new, Athlete.new].map {|person| person.play}

#we can see the 3 unrelated objects respond to this same interface. And we also can see that they do all play something albeit in a different way. This is intentinal
# and therefore can qualify as ducktyping.


# 33.What is encapsulation, and why is it important in Ruby? Give an example.

# encapsulation is the hiding of functionality in code that makes that code unavailable to the rest of the code base. It is a form of data protection to prevent
# unwanted manipulation of code. It is also what defines the boundaries in your application.  Ruby creates classes which encapsulate behaviors, instatiates objects, which
# encapsulate state, and via method calls to expose state to the outercode base to interact with the object.
# an example

class Tree
  def initialize(type)
    @type = type
  end

end

# Classes encapsulates behaviors Which we can see here. Only a Tree class object can be invoked by a method of the class.  Otherwise the hidden functionality can never
# interact with the outer code base.

#34.
module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk


# What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?
# the walkable::walk method being invoked on the mike object will return and output "Mike strolls forward."
# The walkable::walk method being invoked on the kitty object will return and output "Kitty Saunters forward"
 # in this example the module walkable refers to an ability to walk in someway. This is something that both a Person and Cat objecthave the ability to do. However That does
 # not mean a Human and Kitty are tied together in some specific relationship otherwise that would require class inheritance. Considering it is a 'has-a' relationship and
 # not a 'is-a' relationship and makes it a better choice to use code that uses polymorphism through an interface.


 #35 What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?


#Object Oriented Programming (OOP) is a programming paradigm that was designed to
#combat the issues that arise when we have programs of a very large size and
#complexity. As programs grow in size and complexity, the amount of dependcies on
#pieces of code elsewhere in the program grows. If a change is made anywhere in
#the program, it can lead to a cascade of bugs due the dependencies on that piece
#of code. OOP allows our programs to instead become an interaction of many small
#parts, as opposed to a giant blob of dependencies. It allows us to create
#classes with reusability, as well as subclasses for more detailed behaviors.

#36. What is the relationship between classes and objects in Ruby?
# classes in ruby provide a blueprint for objects. Classes are also containers that store the behaviors of it's objects. Objects can also be used to expose information
# of a given class through interfaces.  Objects are particular instances of a given class, storing data, encapsulating state.



#37. When should we use class inheritance vs. interface inheritance?
 # class inheritance should be used when the relationship between the classes is an 'is-a' relationship. For example a Human is a Mammal. Therefore a Human could inherit
 # from a Mammal.
 # Interface inheritance should occur when there is a 'has-a' relationship. Such as a 'Dolphin' class and "Swim" module. A dolphin can swim and therefore it would be
 # more apt to mixin the module swim.

 #38.
 #class Cat
 #end

 #whiskers = Cat.new
 #ginger = Cat.new
 #paws = Cat.new

 # If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`?
 # Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?

 # when using the `==` method to compare `Cat` objects false will be returned. This is because the `BasicObject#==` method is comparing whether the two objects are the same
 # Each object is unique and points to a unique space in memory.

 # This demonstrates that each instantiated object of a class is a unique object and distinguishable from every other instance of the same class.

#39.
class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end

# Describe the inheritance structure in the code above, and identify all the superclasses.
# The base class `Thing` is defined.
# The Subclass `AnotherThing` is defined and inherits from `Thing`. `Thing` is now a superclass
# The Subclass `SomethingElse` is defined and inherits from `AnotherThing`. `AnotherThing` is now a superclass.

#superclasses: `Thing` and `AnotherThing`


#40.
module Flight
  def fly; end
end
module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animals
end

class Birds < Animals
end

class Penguin < Birds
  include Aquatic
  include Migratory
end

pingu = Penguin.new
p Penguin.ancestors

# What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.
#  Flight::fly is invoked on Penguin. The current class Penguin will be searched and the method is not found
# then the search continues with a bottom-up approach searching first `Migratory` and not fiding `fly` and then `Aquatic` and also not finding `fly`.
# we then move into the inheritance chain into `Birds` which the method is not found so we continue into the hierarchy to `Animals`. This is the base class
# and no method `fly` is found. At this point ruby will search further up the loookup path into Ruby built in classes. Starting at `Object`, then `Kernel`, and
# then finally `BasicObject`. No method is found at these levels and an error is raised.
# we can test this by invoking the ancestors method on the current object's class (Penguin).
# or we can  chain the class method on pingu followed by the ancestors method to accomplish the same task.
