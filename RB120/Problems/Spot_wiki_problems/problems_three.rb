require 'pry'
#41.
 class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak



# What does this code output and why?
 # The output is "Daisy says Mooooooooooo!"
 #`Animal` is defined with an instance variable `@name`. and two behaviors of the class  `sound` and `speak`.
 # sound` interpolates string by directly accessing the `@name` instance variables and and prints the result along with 'says'
 # `speak` prints the result of the `sound` method.
 # we then have the `Cow` class which inherits from animal and overrides the superclass `sound` method with it's own `sound` method.
 # this method invokes super which will search for the superclass and grab the results of the previous `sound` method. this is then concatanated with "moooooooooooo!"
 # the Cow `speak` method is then invoked on `daisy`
 # this returns "daisy says "moooooooooooo!""


 #42.
 class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")

  # Do `molly` and `max` have the same states and behaviors in the code above? Explain why or why not, and what this demonstrates about objects in Ruby.
# if you you print p 'max` this is returned => #<Cat:0x000055f35a156168 @name="Max", @coloring="tabby">
# if you print p `molly` this is returned => #<Cat:0x000055d9e7c91398 @name="Molly", @coloring="gray">
# states are referred to when talking about the values of instance variables. Here we can see these values are not the same and therefore `max` and `molly` have different
# states. Behaviors are in reference to methods of a class.  `max` and `molly` are both `Cat` objects and have access to the same methods. Therefore the behaviors are shared
# What is demonstrated here is that each object in ruby is unique and will have it's own specific information.



#43.
class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    self.grade = new_grade
  end
end


priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade


# In the above code snippet, we want to return `”A”`. What is actually returned and why? How could we adjust the code to produce the desired result?
# nil is returned
# this is because the method `change_grade` initializes local variable `grade` and sets it to  the passed in parameter `new_grade`
# we see this because when we inspect  priya.change_grade('A') `A` is returned. However since `grade` was a local variable it did not set are instance variable
# `@grade` to `"A"`.

# to fix this we can access our setter method for `grade` through the use of `self.grade`. Now `@grade` is being set to the result of `new_grade` as the setter is now invoked.
# now when inspecting `priya.grade` `"A"` is returned like initially desired.

#45.
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
    #@grade = nil
  end
end

ade = Student.new('Adewale')
 ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

 #46.
 class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name
p sir_gallant.speak

# Running the following code will not produce the output shown on the last line. Why not? What would we need to change,

# and what does this demonstrate about instance variables?
# @grade has not yet been initialized and in ruby `nil` is the placeholder value of a state until initialization.
# to fix this we need to initialize `@grade` to nil.

#this shows that while a getter and setter method for `@grade` is available that an instance variable will not reflect state and value until it has been initialized.

# The first line of output, "Sir Gallant", is the result of calling `p sir_gallant.name`.
# In the `Knight` class, the `name` method overrides the one in the superclass (`Character`) by calling `super` and appending "Sir " to it.
# Since `@name` in `Knight` is set to "Gallant" when the `Knight` instance is initialized, the result is "Sir Gallant".

# The second line of output, "Gallant is speaking.", is the result of calling `p sir_gallant.speak`.
# The `speak` method does not exist in the `Knight` class,  so it invokes the `speak` method from the superclass (`Character`).
# The superclass's `speak` method interpolates `@name` (which is "Gallant") with " is speaking.", resulting in "Gallant is speaking.".

# To modify the last line of code to output "Sir Gallant is speaking.", we can override the `speak` method in the `Knight` class.
# By doing so, we can prepend "Sir " to the result of `super` to achieve the desired output.
=begin
class Knight < Character
  def name
    "Sir " + super
  end

  def speak
    "Sir " + super
  end
end

=end

#47.
class FarmAnimal
  def speak
    "#{self} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cows < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak
p Lamb.new.speak
p Cows.new.speak


# What is output and why?
=begin

On line 25, the call to the `speak` instance method on the `Sheep` object
outputs `"#<Sheep:0x000001a9f13d67f0> says baa!"`. On line 9 the `speak`
instance method has a call to `super` which finds a method higher up the
inheritance hierarchy with the same name, on line 2, and invokes it.
`"#{self} says "` evaluates to `"#<Sheep:0x000001a9f13d67f0> says '` and is
returned back to line 9 to then concatenate `'baa!'`, which is returned and
output.

On line 26, the call to the `speak` instance method on the `Lamb` object outputs
`"#<Lamb:0x000001a9f13d5df0> says baa!baaaaaaa!"`. First the `speak` instance
method on line 14, via the call to `super`, invokes the `speak` instance method
on line 8. Another call to `super` invokes the `speak` method on line 2.
`"#{self} says "` evaluates to `"#<Lamb:0x000001a9f13d5df0> says `, which is
returned to line 9. We concatenate `'baa!'` onto it creating the string
`"#<Lamb:0x000001a9f13d5df0> says baa!"`, which is returned to line 15, then we
concatenate `"baaaaaaa!"` onto the string creating our final string
`"#<Lamb:0x000001a9f13d5df0> says baa!baaaaaaa!"`.

On line 27, we call the `speak` instance method on the `Cow` object. Similarly
to the `Sheep` scenario, we make a call to `super` on line 21, invoking the
`speak` instance method on line 2. The expression is evaluated to
`"#<Cow:0x000001a9f13d5968> says "`, which is returned to line 21, which has
`"mooooooo!"` concatenated to create the string
`"#<Cow:0x000001a9f13d5968> says mooooooo!"` which is output.


=end

#48.
class Persons
  def initialize(name)
    @name = name

  end
end

class Cats
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Persons.new("Sara")
fluffy = Cats.new("Fluffy", sara)


# What are the collaborator objects in the above code snippet, and what makes them collaborator objects?
# The collaborator objects are `sara` and `fluffy`. This is because the `Persons` object that `sara` refers to is stored in the state of the instance variable `@owner`
# in the `Cats` object that `fluffy` refers to. Also from a relationship point of view `fluffy` has an owner `sara` which is typically the type of relationship that
# collaborator objects have.



#49.
number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end

# What methods does this `case` statement use to determine which `when` clause is executed?
# the `Range#===` method.  this operator is used to tell if a given element is within a range. if so it returns true and false otherwise.  This is the operator used
# by case satements.


#50.
class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end

end

# What are the scopes of each of the different variables in the above code?

# TITLES => lexical, meaning it searches it's surrounding container first to find the given constant. It finds it here in the current container
# @@total_people => Class level, meaning if we check for it within any class level that is not part of an instance method, we will have access to this object.
# @name, @age => Object level, Meaning these variables have their own copies for each particular instance of an object. And wherever that object is accessible, so
# are these variables.


#51.
# The following is a short description of an application that lets a customer place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.


# nouns : meal,  burger, side, drink, order, customer, meal_item, application
# verbs : choose,  compute, place order

class Customer
  def place_order
    # customer choose what he/she wants.
  end
end

class Order
  def compute_order_total
    # figure out order total cost
  end
end

class Meal_item

end

class Burger < Meal_item

end

class Side < Meal_item

end

class Drink < Meal_item

end

class Order
  def compute_cost
 #  gather info on order and then get the total cost.
  end
end

#52.
class Catz
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
    #@age += 1
  end
end

tom = Catz.new('tom')
bob = Catz.new('bob')
p tom.make_one_year_older
p bob.age =
# In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix?
# Which use case would be preferred according to best practices in Ruby? And why?
=begin
 we can directly access the instance variable `@age` and increment by 1 `@age += 1 `
The difference here is that instead of calling the `setter` method age with the
use of `self`, we're accessing the instance variable directly and reassigning it
to `@age + 1`.

Because we have a `attr_accessor` method invoked, with `:type` and `:age` passed
in as arguments, we now have a `setter` and `getter` method available for both
of these instance variables. According to Ruby style guides, if a `setter` or
`getter` method available, we should use those to access the instance variable
instead of doing so directly.

Their are various reasons for preferring to use a `setter` method. By using a
`setter` method, we're encapsulating access to the instance variable, which
maintains one of the core concepts of OOP. We can now control how the instance
variables are accessed and modified.

By using a `setter` method, we have more flexibility with our code. We can add
more functionality to our `setter` methods - we add data validation and
manipulation, and can do so without affecting other parts of the code that use
the class.

It also provides a layer of abstraction that separates the implementation
details from the public interface. We're creating a more intuitive and
descriptive interface for other code to interact with our class.

=end

#53.

module Drivable
  def self.drive

  end
end

class Car
  include Drivable
end

#bobs_car = Car.new
#bobs_car.drive

# What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?
=begin
a NoMethodError is raised. This is because the modulde Drivable has one class method as we see with the use of `self.drive`. The class Car mixes in this module. ,
a local variable is initialized to a new Car Object. This is an instance of the Car class and has the class method `drive` invoked upon it. This causes our error
as a class method cannot be invoked on an instance of a class.

Additionally, we can't define class methods within a module because we cannot
instantiate objects from a module. When defining methods within a module, we
must do so without the use of `self` in order for the methods to be called on
objects.

=end

# 54.

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    self.price <=> other.price
  end

end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more


# What module/method could we add to the above code snippet to output the desired output on the last 2 lines, and why?

=begin
To get our desired output, we can mix in the `Comparable` module and then define
our own `<=>` method. It would look like this:

```
class House
  # rest of code omitted

  include Comparable

  def <=>(other)
    price <=> other.price
  end
end
```

The `<=>` is implicity used in other comparison methods. When we define our own
and override the built-in `<=>` method, we can tell it what to specifically
compare between objects. In this case, we're telling the `<=>` method to compare
the value of `price` between two `House` objects.

By mixing in the `Comparable` module, and defining our own `<=>` method, we are
now given other comparison methods for "free", i.e we no longer have to define
our own and tell them what to compare; our custom `<=>` method does this for us.
The `<=>` method will compare the caller and reciever, and if the value to the
left is greater, it will return `1`. If the value to the left is lesser, it will
return -1, and will return 0 if it is equal.
=end
module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def sides
     self::SIDES
     end

  def self.sides
    Square
  end

end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p  Square.sides # => 4
  Square.new.sides # => 4
p Square.new.describe_shape # => "I am a Square and have 4 sides."
