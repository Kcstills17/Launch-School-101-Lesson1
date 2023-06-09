module Clear
def clear_system
  sleep 1
  system "clear"
end
end


class Person
include Clear
attr_accessor :name

def initialize(name)
  @name = name
end

def show_person
  puts  "this is #{name} and what he is good at "
  clear_system
end
end

zane = Person.new('zane ')
 zane.show_person
