#1. Inherited Year
  #Using the following code, create two classes - Truck and Car - that both inherit from Vehicle.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Car < Vehicle

end

class Truck < Vehicle

end

truck1 = Truck.new(1994)
 truck1.year

car1 = Car.new(2006)
 car1.year

#Expected output:
#1994
#2006


#2. Only Pass the Year
  #Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter bed_type and implement
  #the modification so that Car continues to only accept one argument.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader  :bed_type

  def initialize (year, bt)
    super(year)  # year has already been set from our previous attr_reader so we can use super with year as an argument to access it without redundatly creating a new year instance
    @bed_type = bt
  end

end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
 truck1.year
 truck1.bed_type

#Expected output:
#1994
#Short


#3. start the Engine (Part 2)
#Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle.
#The 'fast' in 'Drive fast, please!' should be the value of speed.

class Vehicles
  def start_engine
    'Ready to go!'
  end
end

class Trucks < Vehicles
  def start_engine(speed)
    super() + " Drive #{speed}, please!"
  end
end

truck1 = Trucks.new
  truck1.start_engine('fast')

#Expected output: Ready to go! Drive fast, please!

#4. Towable (Part 1)
# Using the following code, create a Towable module that contains a method named tow that prints I can tow a trailer! when invoked. Include the module in the Truck class.

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Trucks
  include Towable
end

class Cars
end

truck1 = Trucks.new
truck1.tow

#Expected output: I can tow a trailer!


#5. Towable (Part 2)
  #Using the following code, create a class named Vehicle that, upon instantiation, assigns the passed in argument to @year. Both Truck and Car should inherit from Vehicle.

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truckss < Vehicle  #extra s's to keep on same page as other class questions
  include Towable
end

class Carss < Vehicle

end

truck1 = Truckss.new(1994)
 truck1.year
 truck1.tow

car1 = Carss.new(2006)
 car1.year

#Expected output:
#1994
#I can tow a trailer!
#2006


#6.Method Lookup (Part 1)
  #Using the following code, determine the lookup path used when invoking cat1.color. Only list the classes that were checked by Ruby when searching for the #color method.

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
# path =>  Cat - Animal (these our the custom classes in the hierarchy )


#7. Method Lookup (Part 2)
  #Using the following code, determine the lookup path used when invoking cat1.color. Only list the classes and modules that Ruby will check when searching for the #color method.
=begin

  class Animal
  end

  class Cat < Animal
  end

  class Bird < Animal
  end

  cat1 = Cat.new
  cat1.color

=end


#Nearly every class in Ruby inherits from another class. This is true until the class named BasicObject, which doesn't inherit from a class.
#Some classes also include modules, much like how the Object class includes the Kernel module.

#Here, Ruby searches for the #color method in every class and module in the search path. Since the method isn't anywhere,
#the answer includes every class and module in the search path.




#9. Transportation
#Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.

module Transportation
def can_drive?
  true
end
end

class Vehiclee
  include Transportation
  attr_accessor :model, :year

  def initialize(m, y)
    @model = m
    @year = y
  end
end

class Carr < Vehiclee
  include Transportation

end

class Trucck < Vehiclee
include Transportation

end




test = Vehiclee.new('civic', 2017)
my_truck = Trucck.new('silverado', 2017)
 p my_truck.can_drive?
