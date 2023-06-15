#1. Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

#Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before
 #balance when you refer to the balance instance variable in the body of the positive_balance? method."

#"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

#Who is right, Ben or Alyssa, and why?

# Ben is correct here. The reason is because of the attr_reader which has :balance . This means that Ruby will automatically
# create a method called balance that returns the value of the @balance instance variable.  So when the instance method positive_balance?
# is invoked the variable balance referes to the the return value of the instance variable @balance.

account = BankAccount.new(5)
p account.positive_balance?


#2. Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :product_name
  attr_accessor :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

#Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

#Can you spot the mistake and how to address it?
my_invoice = InvoiceEntry.new('toys', 30)

 my_invoice.update_quantity(5)
 my_invoice.quantity

#the mistake here is in the instance method update_quantity the object that quantity refers to is
# not the same as the object that the instance variable refers to. this will assume quantity is a local variable.
#While object is set in the method  when you access the instance variable quantity of my_invoice it will remain unchanged.

#two possible fixes are to use the @ to directly access the instance variable @quantity. Or  change quantity to be apart of an
# attr_accessor and then refer to self in the instance method update_quantity.


#3.In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable,it must be accessed
# with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

#Is there anything wrong with fixing it this way?
# It works however with the use of attr_accessor  it allows the instance variable @quantity to be changed directly. As opposed to going through  the update_quantity
# method only. This could cause unwanted issues for the program elsewhere.




# 4. Let's practice creating an object hierarchy.

# Create a class called Greeting with a single instance method called greet that takes a string argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye.
# The Hello class should have a hi method that takes no arguments and prints "Hello".
# The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when
# implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting

  def greet(message)
    puts message
  end

end

class Hello < Greeting

  def hi
    greet('Hello')
  end

end

class Goodbye < Greeting

  def bye
    greet('Bye')
  end

end


ohayo = Hello.new
ohayo.hi

sayonara = Goodbye.new
sayonara.bye


#5. You are given the following class that has been implemented:

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
end

#And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

 donut1
 # => "Plain"

 donut2
 # => "Vanilla"

 donut3
 # => "Plain with sugar"

 donut4
 # => "Plain with chocolate sprinkles"

 donut5
 # => "Custard with icing"

#Write additional code for KrispyKreme such that the puts statements will work as specified above.

# here we use a sequence of ternarys for our to_s. We are initializing filing_string and glazing string based on the logic to set each to the corresponding instance variables
# when those values are not nil. And elsewise to return "Plain" and "" respectivelly. glazing_str also when returning the @glazing instance return value returns a prepending
# "With" to match the given code.
# now we simply concatanate filling_string with glazing_str



#6. If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

my_computer = Computer.new




class Computer2
  attr_accessor :template

  def create_template
    @template = 5
  end

  def show_template
    self.template
  end
end

your_computer = Computer2.new
p your_computer.show_template
p your_computer.template

#What is the difference in the way the code works?
