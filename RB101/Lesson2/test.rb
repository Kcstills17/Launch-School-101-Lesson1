def my_method(str)
  str << "def"
  str.object_id
  str = 'xyz'
  p str.object_id

end

a = 'abc'
my_method(a)
p a.object_id
p a


