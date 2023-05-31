#1. Reading and Writing
  #Add the appropriate accessor methods to the following code.

class Person
 attr_accessor :name

 def initialize
  @name = name
 end
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

#xpected output:
#Jessica

# 2. Choose the Right Method
#Add the appropriate accessor methods to the following code.

class Person
  attr_accessor :name, :phone_number

end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
person1.name
person1.phone_number

#Expected output:
#Jessica


#3. Access Denied
#Modify the following code so that the value of @phone_number can still be read as on line 10, but cannot be changed as on line 12.
=begin
class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number
=end
#Expected output:
#1234567899
#NoMethodError


#4 Comparing Names
#Using the following code, add the appropriate accessor methods. Keep in mind that the last_name getter shouldn't be visible outside the class,
#while the first_name getter should be visible outside the class.

class Person
  attr_accessor :first_name
  attr_writer :last_name
  def first_equals_last?
  first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
person1.first_equals_last?


#Expected output:
#false

#5. Who is Older?
#Using the following code, add the appropriate accessor methods. Keep in mind that @age should only be visible to instances of Person.

class Person
  attr_writer :age
  def older_than?(other)
    age > other.age
  end


protected
  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
 person2.age = 26

 person1.older_than?(person2)

#Expected output:
#false



#6.  Guaranteed Formatting
#Using the following code, add the appropriate accessor methods so that @name is capitalized upon assignment.

class Person
  attr_accessor :name
  def name=(name)
    @name = name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
 person1.name

#Expected output:
#Elizabeth






#7. Prefix the Name
  #Using the following code, add the appropriate accessor methods so that @name is returned with the added prefix 'Mr.'.

class Person
attr_writer :name

def name
"Mr. #{@name}"
end
end

person1 = Person.new
person1.name = 'James'
puts person1.name

#Expected output:
#Mr. James




#. Avoid Mutation
#The following code is flawed. It currently allows @name to be modified from outside the method via a destructive method call.
  #Fix the code so that it returns a copy of @name instead of a reference to it.
=begin
class Person


  def initialize(name)
    @name = name
  end

  def name
   @name.clone
  end
end

person1 = Person.new('James')
puts person1.name.reverse!.object_id
puts person1.name.object_id
=end
#Expected output:
#James



#9. Calculated Age
#Using the following code, multiply @age by 2 upon assignment, then multiply @age by 2 again when @age is returned by the getter method.

class Persons
  def age=(age)
    @age = double(age)
  end

  def age
    double(@age)
  end

  private

  def double(value)
    value * 2
  end
end


person2 = Persons.new
person2.age = 20

person2.age

#Expected output:
#80




#10. Unexpected Change
#Modify the following code to accept a string containing a first and last name. The name should be split into two instance variables in the setter method,
#then joined in the getter method to form a full name.

class Person3

  def name=(name)
    @first_name = name.split.first
    @last_name = name.split.last

  end

  def name
    "#{@first_name} #{@last_name}"

  end
end

person1 = Person3.new
p person1.name = 'John Doe'
puts person1.name

#xpected output:

#John Doe
