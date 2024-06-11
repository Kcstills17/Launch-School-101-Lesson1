# 1.Fix the Program - Mailable
# Correct the following program so it will work properly. Assume that the Customer and Employee classes have complete implementations;
# just make the smallest possible change to ensure that objects of both types have access to the print_address method.

module Mailable
  def print_address
    "#{name}"
    "#{address}"
    "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address

# 2.Fix the Program - Drivable
# Correct the following program so it will work properly. Assume that the Car class has a complete implementation;
# just make the smallest possible change to ensure that cars have access to the drive method.

module Drivable
  def drive; end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# methods using mixins from modules should avoid using self. Otherwise the only way to access that module is to specify that specific class like here Drivable.drive
# it is also not available at all as an instance method to objects

# 3.Complete The Program - Houses
# Assume you have the following code:

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
home1.price
"Home 1 is cheaper" if home1 < home2
"Home 2 is more expensive" if home2 > home1

# and this output:

# Home 1 is cheaper
# Home 2 is more expensive

# Modify the House class so that the above program will work. You are permitted to define only one new method in House.

# 4. Reverse Engineering
# Write a class that will display:

# ABC
# xyz

# when the following code is run:

class Transform
  attr_reader :name

  def initialize(data)
    @data = data
  end

  def uppercase
    @data.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')

my_data.uppercase
Transform.lowercase('XYZ')

# the last line is a class that is having a method that is invoked upon it. So because it is a class when we define lowercase in the Transform class we want to make sure that the
# action is being performed on the class itself using the self moniker. also class methods do not obtain information from else since it cannot access instance varibales
# because of this we must pass an argument to get the str we wish to lowercase.
# the uppercase method is simply being performed on an instance of the class

# 5. What Will This Do?

# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
Something.dupdata
thing.dupdata

# thing is a instance variable that has just been instantiated the data from the class something. And should include it's generated self info and the string 'hello'
# the second line will print out ByeBye as this dupdata is being invoked on the class Something. And within Something a  class method dupdata is invoked on Something
# and that line prints out "ByeBye "
# the 3rd line will print out "HelloHello" as the instance variable thing has the instance method dupdata invoked upon it and within that method @data is added to @data. both
# being "Hello"

# 6. Comparing Wallets
# Consider the following broken code:

class Wallet
  attr_reader :amount

  protected

  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
# puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  # puts 'Penny has more money than Bill'
end

# modify this code so it works. Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.

# 7. Pet Shelter
# Consider the following code:

class Pet
  attr_reader :animal, :name

  @@creature_list = []
  @@pet_count = 0
  def initialize(animal, name)
    @animal = animal
    @name = name
    @@pet_count += 1
    @@creature_list << [animal, name]
  end

  def to_s
    "a #{animal} named #{name}"
  end

  def self.pet_count
    @@pet_count
  end

  def self.animal_list
    @@creature_list
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  def initialize
    @owners = {}
  end

  @@adopted = 0
  @@adopted_list = []

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
    @@adopted += 1
    @@adopted_list << pet.name
  end

  def self.current_creatures(list)
    remaining_list = []
    @@adopted_list
    list.map do |arr|
      @@adopted_list.include?(arr[-1]) ? @@adopted_list : remaining_list << arr
    end
    @@adopted_list = remaining_list
  end

  def self.left_shelter
    @@adopted
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

  def print_remaining_creatures
    puts "The Animal Shelter has the following unadopted pets"
    @@adopted_list.each do |creature, name|
      puts "a #{creature} named #{name}"
    end
  end
end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# doug = Pet.new('dog', 'Doug')
# banks = Pet.new('dog', 'Banks')
# chase = Pet.new('hamster', 'Chase')
# animals_and_names = Pet.animal_list

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new

# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)

# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)

# shelter.adopt(bholmes, chester)
# Shelter.left_shelter
# Shelter.current_creatures(animals_and_names)
# shelter.print_adoptions
# shelter.print_remaining_creatures

# "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# "The Animal shelter has #{Pet.pet_count - Shelter.left_shelter} unadopted pets "

# Write the classes and methods that will be necessary to make this code run, and print the following output:

# p Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# The order of the output does not matter, so long as all of the information is presented.

# bonus display all unadopted creatures and their names. And then display the amount of unadopted creatures there are remaining
# first we must get a count of all creatures. We can create a class variable that is incremented by 1 at each initialization in the Pet class
# now we must display all creatures/names that are unadopted. To do this we must first access a list of all creatures and their names within the shelter class. We likely
# can pass an argument that is the result of the Pet class to get this. Once we have this we must remove each element that is present in the adopted list. Once we have our remaining
# list we can iterate through each element and print this for each one a #{creature} named #{name}
# for each creature/name we store increment a name class vatiable @@not_adopted. We wil subtract this from the class count of all creatures and display this count

=begin

#8. Moving
  #You have the following classes.

  module Walkable
    def walk
      "#{self.name} #{gait} forwards"
    end
  end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    "#{self.name} #{gait} forwards"
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

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

#You need to modify the code so that this works:

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
end
# => "Flash runs forward"

#You are only allowed to write one new method to do this.

=end
# 9. Nobility
# Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.
# We need a new class Noble that shows the title and name when walk is called:

module Walkable
  def walk
    @title == nil ?  "#{self.name} #{gait} forwards" :  "#{@title} #{self.name} #{gait} forwards"
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

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  private

  def gait
    "strolls"
  end
end

mike = Person.new("Mike")
p mike.walk
# Output: "Mike strolls forwards"

kitty = Cat.new("Kitty")
p kitty.walk
# Output: "Kitty saunters forwards"

flash = Cheetah.new("Flash")
p flash.walk
# Output: "Flash runs forwards"

byron = Noble.new("Byron", "Lord")
p byron.walk
# Output: "Byron strolls forwards"




=begin
  Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

P. Understand the Problem
  Explicit Requirements:
  - we are given an array and an integer
  - our goal is to find 2 indexes from our input array that add up to be the input integer

  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases


D: Data Structures
  - input: array and int
  - output: array
  - possible intermediary structure: array


A: Algorithm
- we need to get each pair of indexes that represent two integers that match our given input
- initialize an empty arr
- we can iterate through the input array and get an array from 0 to the size of the input arr non inclusive.  name that param elem
- then iterate from elem + 1 to the size of the arr non inclusive
- append to the new array a arr that is [arr[elem], arr[inner_elem]]

- now pass through that new array into the main method
  - iterate through the arr and get each first element and second element.
  - seelct the arr that when the input arr[first_element] + input_arr[second_element] is == to the input integer
  - return that arr or series of arrays

C: Code with intent



=end





