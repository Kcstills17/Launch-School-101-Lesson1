names = ['Sally', 'Joe', 'Lisa', 'Henry']


loop do
  names.shift
  p names
  break if names.size == 0
end
