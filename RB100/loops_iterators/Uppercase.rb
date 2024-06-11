#change all string to uppercase  if the string count is greater than 10

def uppercase_greater_than_10(word )
  if word.length > 10
     word.upcase
  else
    word
  end
end

puts uppercase_greater_than_10('Hello world')




