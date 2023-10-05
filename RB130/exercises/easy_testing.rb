require 'minitest/autorun'

class BooleanTest < MiniTest::Test


=begin
1. Boolean Assertions

Write a minitest assertion that will fail if the value.odd? is not true.
=end

def test_odd?
  value = 1
  assert_equal(true, value.odd?)
end



=begin

2. Equality Assertions

Write a minitest assertion that will fail if value.downcase does not return 'xyz'.


=end

def test_string
  str = 'XYZ'
  assert_equal('xyz',  str.downcase)
end

=begin

3. Nil Assertions

Write a minitest assertion that will fail if value is not nil.

=end

def test_for_nil
  value = nil
 assert_nil(value)
end

=begin

4. Empty Object Assertions

Write a minitest assertion that will fail if the Array list is not empty.


=end

def test_empty
  value = []
  assert_empty(value )
end

=begin


5. Included Object Assertions

Write a minitest assertion that will fail if the 'xyz' is not in the Array list.


=end


def test_include
  collection = ['a', 'b', 'xyz']
  assert_includes(collection, 'xyz')
end

=begin


6. Exception Assertions

Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

=end

=begin
def test_raise
  assert_raises NoExperienceError do
    employee.hire
  end
end
=end
end

=begin

7. Type Assertions

Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

=end

#assert_instance_of Numeric, value


=begin


8. Kind Assertions

Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).


=end

#assert_kind_of Numeric, value
=begin

9. Same Object Assertions

Write a test that will fail if list and the return value of list.process are different objects.


=end



assert_same(list, list.process)

assert_equal(list.object_id, list.process.object_id)


=begin

10. Refutations

Write a test that will fail if 'xyz' is one of the elements in the Array list:


=end

list = ['a', 'xyz']

refute_includes(list, 'xyz')



