#Will the following code execute?
require 'pry'

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



class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels
p Vehicle.wheels

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels


class Foo
  @@var = 1

  def self.var
    @@var
  end
  puts Foo.var
end

class Bar < Foo
  @@var = 2
end

puts Foo.var
puts Bar.var
