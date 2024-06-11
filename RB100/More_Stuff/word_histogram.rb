# creating a word histogram

puts "Enter a phrase you'd like to analyze: "
text = gets.chomp  #first we must receive data from the user. Which a gets method does the trick.

words = text.split   # We want to count every word individually so we must first access each word by splitting the text. This create an array
frequencies = Hash.new(0) #now we create a hash. We will want to access key:pairs later on. We will call it
                          #frequencies since we want to allude to the frequency of each word.  We also set the value to 0
                          # this is important when we want to increase the frequency.

words.each do |word|      #now we must iterate through our word array. each is a prompt method
frequencies[word] += 1  # here we access our frequencies hash and through that we access our iterated variable word for the words array.
end                        # what we want to do is increase the value by one each time a word is iterated. += 1
#p frequencies
frequencies = frequencies.sort_by {|k ,v| v}    # assigning frequencies to itself being modified by sort by creates a separate hash.
# p frequencies                                 # it also  sorts the key and value from the smallest to largest. we then access the value with the v variable.
 frequencies.reverse!                         # then we reverse the hash, thus having the value returned from largest to smallest

frequencies.each do |word, frequency|           # our final step once again has us iterate through our frequencies hash
puts word + " " + frequency.to_s                # we then want to get back our word followed by space and then finished with our frequency.
end                                             # the value is in an integer so we use .to_s to show it as a string.

