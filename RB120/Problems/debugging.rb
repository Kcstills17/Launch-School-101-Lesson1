#1.On line 42 of our code, we intend to display information regarding the books currently
# checked in to our community library. Instead, an exception is raised. Determine what caused
# this error and fix the code so that the data is displayed as expected.
require 'pry'
class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

 community_library.check_in(learn_to_program)
 community_library
 community_library.check_in(little_women)
 community_library.check_in(wrinkle_in_time)
  community_library.books


=begin
we are giving a NoMethodError. This is because the display_data book behavior is called upon an array object containing all Book objects that
have  been appended to the Library check in. To fix this we can use a block to get each book element. We can use the term book for each
iteration and call display_data on each book. Now this is the proper object for our Book behavior.

 community_library.books.each {|book|  book.display_data}
=end


#2. Animal Kingdom
#The code below raises an exception. Examine the error message and alter the code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
 penguin = FlightlessBird.new(:carnivore, 'drink sea water')
 robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

=begin
we are given a wrong number of arguments (given 3, expected 2) ArgumentError. Given that line 110 refers to the initializattion of a new SongBird object
we can check the SongBird class. We can see we are given 3 parameters and then a super. However to use the super for our 2 parameters and allow for
a 3rd class unique param we must supply the super with those two parameters. e/g. super(diet, superpower). Without this the super will immediately
lookup the class chain and see that the super class has a different amount of params then the given params at the current class. This will throw our ArgumentError
=end


#3.Wish You Were Here
# On lines 37 and 38 of our code, we can see that grace and ada are located at the same coordinates.
# So why does line 39 output false? Fix the code to produce the expected output.

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end

end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end


  def ==(other_location)
    to_s == other_location.to_s
  end

end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)


 ada.location                   # (-33.89, 151.277)
 grace.location                 # (-33.89, 151.277)
 ada.location == grace.location # expected: true
                                    # actual: false

=begin

when looking around I was able to find that  while yes the puts statement of both ada.location and grace.location  are the same. The object values
are not. the base == method is looking to see if they have the same values. We are not looking to see that. To fix this issue we create
a new == method for our GeoLocation Class. with one parameter (we will use other_location). within the method check that to_s is ==
to other_location to_s. Now this method is checking if the to_s methods have the same value. And since they do we now return true.
=end



#4.Employee Management
# We have written some code for a simple employee management system. Each employee must
# have a unique serial number. However, when we are testing our program, an exception is raised.
# Fix the code so that the program works as expected without error.

class EmployeeManagementSystem
  attr_reader :employer

  def initialize(employer)
    @employer = employer
    @employees = []
  end

  def add(employee)
    if exists?(employee)
      puts "Employee serial number is already in the system."
    else
      employees.push(employee)
      puts "Employee added."
    end
  end

  alias_method :<<, :add

  def remove(employee)
    if !exists?(employee)
      puts "Employee serial number is not in the system."
    else
      employees.delete(employee)
      puts "Employee deleted."
    end
  end

  def exists?(employee)
    employees.any? { |e| e == employee }
  end

  def display_all_employees
    puts "#{employer} Employees: "

    employees.each do |employee|
      puts ""
      puts employee.to_s
    end
  end

  private

  attr_accessor :employees
end

class Employee
  attr_reader :name

  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
  end

  def ==(other)
    serial_number == other.serial_number
  end

  def to_s
    "Name: #{name}\n" +
    "Serial No: #{abbreviated_serial_number}"
  end

  protected

  attr_reader :serial_number

  def abbreviated_serial_number
    serial_number[-4..-1]
  end
end

# Example

miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

becca = Employee.new('Becca', '232-4437-1932')
raul = Employee.new('Raul', '399-1007-4242')
 natasha = Employee.new('Natasha', '399-1007-4242')

#miller_contracting << becca     # => Employee added.
#miller_contracting << raul      # => Employee added.
#miller_contracting << raul      # => Employee serial number is already in the system.
#miller_contracting << natasha   # => Employee serial number is already in the system.
#miller_contracting.remove(raul) # => Employee deleted.
#miller_contracting.add(natasha) # => Employee added.

#miller_contracting.display_all_employees

=begin
our issue is that `abbreviated_serial_number` is a `private` method in ths `Employee` class. Because our `to_s` method is directly interpolating
`abbreviated_serial_number` and it being  `private` means the method can only be invoked on `self`. This is not the case when it is within a different
instance method. To fix this we can change `private` to `protected`. Therefore other instance methods or behaviors can call the `abbreviated_serial_number`such
as `to_s`. With that the code runs as expected.
=end


#5.Sorting Distances
# When attempting to sort an array of various lengths, we are surprised to see that an ArgumentError is raised.
# Make the necessary changes to our code so that the various lengths can be properly sorted
# and line 62 produces the expected output.

class Length
  include Comparable
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  def ==(other)
    case unit
    when :km  then value == other.as_kilometers.value
    when :mi  then value == other.as_miles.value
    when :nmi then value == other.as_nautical_miles.value
    end
  end

  def <=>(other)
    case unit
    when :km  then value <=> other.as_kilometers.value
    when :mi  then value <=> other.as_miles.value
    when :nmi then value <=> other.as_nautical_miles.value
    end
  end


  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example
  [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

=begin
the Length class had no way of comparing any values. So we needed to refefine the <=> method within the class to compare each unit
:km, :mi, and :nmi to when the other comparison is being used as mi, kms, or nmis

=end




#6.Bank Balance
# We created a simple BankAccount class with overdraft protection, that does not allow a withdrawal
# greater than the amount of the current balance. We wrote some example code to test our program. However,
# we are surprised by what we see when we test its behavior. Why are we seeing this unexpected output? Make
# changes to the code so that we see the appropriate behavior.

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && valid_transaction?(balance - amount)
      success = (self.balance -= amount)
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
 account.balance         # => 0
 account.deposit(50)     # => $50 deposited. Total balance is $50.
 account.balance         # => 50
 account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
 account.balance         # => 50


=begin
the issue is with our lack of valid_transaction use in the withdrawal method. As of now we are never checking if we are getting a valid
transaction when withdrawing and the success boolean condition is set to true whenever the argument is > 0. We dont want that as that argument
can still be more than what we have currently depositied. Using valid_transaction?(balance - amount) we are only returning true when the value
is >= 0. since it will only be >= 0 when we are trying to withdraw only what  we have. This sets the logic correctly and now the code executes as intended.
=end



#7.ask Manager
# Valentina is using a new task manager program she wrote. When interacting with her task manager,
# an error is raised that surprises her. Can you find the bug and fix it?

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []

  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    #binding.pry
    display(tasks)
  end

  def display_high_priority_tasks
    high_end_tasks  = tasks.select do |task|
      task.priority == :high
    end

    display(tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')


valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

#valentinas_tasks.complete_task('read OOP book')

#valentinas_tasks.display_all_tasks

#valentinas_tasks.display_high_priority_tasks


=begin
in the display_high_priority_tasks method we are referring to tasks as a local variable and not as our setter method tasks. This is because this left hand value is being
set the result of the select method invocation. One problem however, Because we are now pointing to local variable tasks but we are trying to invoke select on our
  instance method @tasks that our setter method  returns. We now are calling select on a `nil` method.  We obviously want to call select on our  setter method `tasks`
 So to easily avoid this problem we can change the name of our local variable to something like   `high_end_tasks` and now the code runs properly.

=end


#9. You've Got Mail!
# Can you decipher and fix the error that the following code produces?

class Mail
  def to_s
    "#{self.class}"
  end
end

class Email < Mail
  attr_accessor :subject, :body

  def initialize(subject, body)
    @subject = subject
    @body = body
  end
end

class Postcard < Mail
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

module Mailing
  def receive(mail, sender)
    mailbox << mail unless reject?(sender)
  end

  # Change if there are sources you want to block.
  def reject?(sender)
    false
  end

  def send(destination, mail)
    "Sending #{mail} from #{name} to: #{destination}"
    # Omitting the actual sending.
  end
end

class CommunicationsProvider

  attr_reader :name, :account_number

  def initialize(name, account_number=nil)
    @name = name
    @account_number = account_number
  end
end

class EmailService < CommunicationsProvider
  include Mailing

  attr_accessor :email_address, :mailbox

  def initialize(name, account_number, email_address)
    super(name, account_number)
    @email_address = email_address
    @mailbox = []
  end

  def empty_inbox
    self.mailbox = []
  end
end

class TelephoneService < CommunicationsProvider
  def initialize(name, account_number, phone_number)
    super(name, account_number)
    @phone_number = phone_number
  end
end

class PostalService < CommunicationsProvider
  include Mailing
  attr_accessor :street_address, :mailbox

  def initialize(name, street_address)
    super(name)
    @street_address = street_address
    @mailbox = []
  end

  def change_address(new_address)
    self.street_address = new_address
  end
end

rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
#ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')
#puts johns_postal_service.send(ellens_postal_service, Postcard.new('Greetings from Silicon Valley!'))

# => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError)

=begin
our issue was the method `send` that was invoked on `johns_postal_service`. Why does Ruby not complain that there is no method send?
First it looks for send on the method lookup path, and it actually finds a method with this name in the Object class. So it calls Object#send,
which expects a method name as the first argument. Since the first argument we provide, '860 Blackbird Ln.', is not the name of any method,
we get an error. The Module `Mailing` which that method presides is not included in the `Postal_Service` class or it's preceeding super class
`CommunicationsProvider`. Therefore you have a NoMethod error when the code is ran. We want to make sure we include the module in the Postal_Service class
as other classes that inherit from CommunicationsProvider such as TelephoneService does not have a mailing system.
=end



#10.Does it Rock or Not?

#We discovered Gary Bernhardt's repository for finding out whether something rocks or not, and decided to adapt it for a simple example.

class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
def self.count(query, api_key)
unless valid?(api_key)
  raise AuthenticationError, 'API key is not valid.'
end

rand(200_000)
end

private

def self.valid?(key)
key == 'LS1A'
end
end

module DoesItRock
API_KEY = 'ZANE'

class NoScore; end

class Score < AuthenticationError
def self.for_term(term)
  positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
  negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)

  (positive * 100) / (positive + negative)
rescue ZeroDivisionError
 #NoScore => this is actually the class itself and in a case statement will be compared to see if it is_a? NoScore instance which it is not
 NoScore.new #an instance of NoScore will allow the case statement when NoScore to evaluate to true
end
end

def self.find_out(term)
score = Score.for_term(term)
case score
when NoScore
  "No idea about #{term}..."
when 0...40
  "#{term} is not fun."
when 40...60
  "#{term} seems to be ok..."
else
  "#{term} rocks!"
end
rescue Exception => e
e.message
end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# In order to test the case when authentication fails, we can simply set API_KEY to any string other than the correct key.
# Now, when using a wrong API key, we want our mock search engine to raise an AuthenticationError, and we want the
# find_out method to catch this error and print its error message API key is not valid.

#Is this what you expect to happen given the code?

#And why do we always get the following output instead?

#Sushi rocks!
#Rain rocks!
#Bug hunting rocks!



=begin


The SearchEngine indeed raises an AuthenticationError, but it never reaches the DoesItRock::find_out method,
because Score::for_term already catches it, resulting in the return value NoScore.

But if the return value is NoScore, why does the find_out method not print the message "No idea about #{term}..."?
In order to see this, recall how case statements work. The value of score will be compared with each value in the when
clauses using the === operator. In case of the first when clause, the comparison is NoScore === score, and since the left
hand side is a class, its implementation boils down to checking whether score is_a? NoScore. This yields false
when score has the value NoScore, as it is not an instance of the NoScore class. As a result, we end up with the value of the else clause.

In order to fix this, Score::for_term has to return an instance of the NoScore class (i.e. NoScore.new), instead of the name of the class itself.


Now, back to the original problem: if the API key is wrong, we want the AuthenticationError to reach the find_out method.
One way to achieve this is to simply remove the rescue clause in Score::for_term. But this would also prevent us from rescuing
other exceptions, like a possible ZeroDivisionError, which arguably is a perfect occasion to return no score. In order to solve
this, we decide to rescue only that specific exception within Score::for_term and let all others through.

With those changes, the code runs as expected. However, there is still one thing wrong about our code, which is less obvious.
And that's the use of Exception.

Exception is the top-most class in Ruby's exception hierarchy and it seems a straightforward choice to rescue or inherit from.
But it's too broad. When creating custom exceptions and when rescuing exceptions, it's good practice to always use the subclass
StandardError. StandardError subsumes all application-level errors. The other descendants of Exception are used for system
or environment-level errors, like memory overflows or program interruptions. These are the kind of errors your application
usually does not want to throw - and definitely does not want to rescue, they should be handled by Ruby itself.
=end
