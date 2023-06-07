=begin
First Exercise
1. Create a class called MyCar. When you initialize a new instance or object of the class,
allow the user to define some instance variables that tell us the year, color, and model of the car.
Create an instance variable that is set to 0 during instantiation of the object to track the current speed
of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method
  that allows you to view, but not modify, the year of your car.

3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform.
   Create a method called spray_paint that can be called on an object and will modify the color of the car.

class MyCar
  attr_accessor :year, :color, :model,  :speed

  def  initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
    "Voila! Now my car is #{color}. Massive Improvement"

  end

  def increase_speed(number)
    self.speed += number
    "I need to speed up my #{model}'s speed. Turbo time! Im gunning at #{speed } mph! "
  end

  def brake(number)
    self.speed -= number
    "Ooh I really need to slow down. Brake activate! now my speed is #{speed} mph"
  end

  def stop_car
    self.speed = 0
    'I have to stop now. There is my destination'
  end

  def car_and_speed
    "The car is a #{color} #{year} honda #{model} and it is moving at a speed of #{speed} mph"
  end
end

 honda =  MyCar.new('2020', 'red', 'civic')
 honda.car_and_speed
 honda.spray_paint('powder blue')
 honda.increase_speed(95)
 honda.brake(70)
 honda.class

 # Class Methods
=begin
Second Exercise
1. Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.
2. Override the to_s method to create a user friendly print out of your object.

class MyCar
  attr_accessor :year, :color, :model,  :speed
  def self.mpg(miles, gallon)
    miles/ gallon
  end

  def  initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def spray_paint(color)
    puts "Hmm. I am bored with my car's current color. Time to spice it up"
    puts "...Several Hours later"
    self.color = color
    "Voila! Now my car is #{color}. Massive Improvement"

  end

  def increase_speed(number)
    self.speed += number
    "I need to speed up my #{model}'s speed. Turbo time! Im gunning at #{speed } mph! "
  end

  def brake(number)
    self.speed -= number
    "Ooh I really need to slow down. Brake activate! now my speed is #{speed} mph"
  end

  def stop_car
    self.speed = 0
    'I have to stop now. There is my destination'
  end

  def car_and_speed
    "The car is a #{color} #{year} honda #{model} and it is moving at a speed of #{speed} mph"
  end

  def to_s
    "#{color} #{year} honda #{model}"
  end
end

MyCar.mpg(351, 13)
#puts  honda

# 3. Why do we get this error and how do we fix it?
class Person
  attr_accessor:name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

#We get this error because attr_reader only creates a getter method.
#When we try to reassign the name instance variable to "Bob", we need a setter method called
#name=. We can get this by changing attr_reader to attr_accessor or attr_writer if we don't intend to use the getter functionality.

=begin
Exercises 3
Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass.
Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

=end

module Bedding
  def has_bed
    "this has a large bed in the back of the vehicle"
  end
end

class Vehicle
  attr_accessor :year, :color, :model, :speed

  def self.mpg(miles, gallon)
    miles / gallon
  end

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    "This method has created #{@@number_of_vehicles} vehicles"
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
  end

  def age
    "your car age is #{years_old} years old"
  end

  private

  def years_old
    Time.now.year - year
  end

  def spray_paint(color)
    puts "Hmm. I am bored with my car's current color. Time to spice it up"
    puts "...Several Hours later"
    self.color = color
    "Voila! Now my car is #{color}. Massive Improvement"
  end

  def increase_speed(number)
    self.speed += number
    "I need to speed up my #{model}'s speed. Turbo time! Im gunning at #{speed} mph! "
  end

  def brake(number)
    self.speed -= number
    "Ooh I really need to slow down. Brake activate! now my speed is #{speed} mph"
  end

  def stop_car
    self.speed = 0
    'I have to stop now. There is my destination'
  end

  def to_s
    "#{color} #{year} honda #{model}"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s
    "My car color is #{color} and it's a #{year} Mazda #{model}"
  end
end

class MyTruck < Vehicle
  include Bedding
  NUMBER_OF_DOORS = 2
  def to_s
    "My truck color is #{color} and it's a #{year} Chevy #{model}"
  end
end

my_car = MyCar.new(2014, 'blue', '3')
my_car.to_s
my_truck = MyTruck.new(2017, 'gray', 'silverado')
Vehicle.number_of_vehicles
my_truck.has_bed
Vehicle.ancestors
MyCar.ancestors
MyTruck.ancestors
my_truck.age


#Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error.
#Create a better_grade_than? method, that you can call like so... puts "Well done!" if joe.better_grade_than?(bob)

class Student
  attr_accessor :name, :grade

  def initialize(n, g)
    @name = n
    @grade = g
  end

def better_grade_than?(student)
  self.grade > student.grade ? 'well done' : "better Luck next time"
end

  protected

  def grade
    @grade
  end

end

 joe = Student.new("joe", 97)
 bob = Student.new("bob", 91 )
joe.better_grade_than?(bob)



#Given the following code...

#bob = Person.new
#bob.hi

#And the corresponding error message...

#NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
#from (irb):8
#from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

#Given the below usage of the Person class, code the class definition.


#Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end


 bob = Person.new('Robert Smith')
 rob = Person.new('Robert Smith')
  "this is #{bob}"



#Lecture: Inheritance
#Class based inheritance works great when it's used to model hierarchical domains. Let's take a look at a few practice problems.
#Suppose we're building a software system for a pet hotel business, so our classes deal with pets.

  #Given this class:

#class Dog
 # def speak
 #   'bark!'
 # end

  #def swim
   # 'swimming!'
  #end
#end

#class Bulldog < Dog
#  def swim
#    "Can't swim"
#  end
#end

#teddy = Bulldog.new
#puts teddy.speak           # => "bark!"
#puts teddy.swim           # => "swimming!"

#One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors.
#For example, bulldogs can't swim, but all other dogs can.

#Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"


#2. Let's create a few more methods for our Dog class.
class Pet

  def run
    "running"
  end

  def jump
    "jumping"
  end

end

class Dog < Pet
  def swim
    "Swimming"
  end

  def speak
    'Barking'
  end

  def fetch
    "Fetch "
  end
end

class Bulldog < Dog
  def swim
    "Can't swim"
  end
end

class Cat < Pet

  def speak
    "Meowing"
  end

  def climb
    "climbing"
  end
end
#Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing.
#Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

tom = Cat.new
 tom.speak
spike = Dog.new
 spike.swim
bud = Bulldog.new
 bud.swim
 Bulldog.ancestors
 Dog.ancestors
 Cat.ancestors
 Pet.ancestors



 class Behavior



 def logic(choice)
  case choice
  when 'Naruto'.downcase
    then ['paper', 'scissors'].sample
  when 'Goku'.downcase
    then 'rock'
  when 'Luffy'.downcase
    then ['spock', 'lizard'].sample
  when 'Ren'
    then ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample
  end
 end
end


test = Behavior.new
puts  test.logic(['naruto', 'goku', 'luffy'].sample)
