# 1. Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

=begin
array = [1,2,3,4,5,6,7,8,9,10]

array.each {|num|puts num}
=end


# 2.Same as above, but only print out values greater than 5.

=begin
array = [1,2,3,4,5,6,7,8,9,10]


array.each do |num|
  if num > 5
    puts num
  end
end

=end



# 3. Now, using the same array from #2, use the select method to extract all odd numbers into a new array.

=begin

array = [1,2,3,4,5,6,7,8,9,10]

new_array = array.select do |num|
  num %2 != 0
end

p new_array

=end


# 4.  Append 11 to the end of the original array. Prepend 0 to the beginning

=begin

array = [1,2,3,4,5,6,7,8,9,10]

 array.unshift(0)
p array.push(11)  #both of these do the trick, however do remember they are destructive and mutate the original array.


=end


# 5.Get rid of 11. And append a 3.


=begin

array = [0,1,2,3,4,5,6,7,8,9,10,11]

array.pop
array.push(3)   # both, once again destructive
p array


=end

# 6.  Get rid of duplicates without specifically removing any one value.


=begin


array = [0,1,2,3,4,5,6,7,8,9,10,11,3]

 p array.uniq  #does not mutate, however if uniq! is used it is mutated


 =end


 # 7.What's the major difference between an Array and a Hash?
=begin
 array's are a sequence of ordered lists.
 Hash's are a sequence of key:value pairs

 =end


 #8. Create a Hash, with one key-value pair, using both Ruby syntax styles.
      =begin
 hash1 = {number:1, number:2, number:3}

 hash2 = {:number => 1, :number => 2, :number => 3}
=end

#9. Suppose you have a hash h = {a:1, b:2, c:3, d:4}
# Get the value of key `:b`.

#Add to this hash the key:value pair `{e:5}`

# Remove all key:value pairs whose value is less than 3.5

=begin


hash = {a:1, b:2, c:3, d:4}

  p hash[:b] # all that needs to be done is the hash followed by brackets and key to access the value

p hash[:e] = 5 # to add a new pair use the hash followed by the brackets with the key. then assign it to the value to want

hash.delete_if do |k,v| # anything within this method that evaluates as a truthy value will be deleted.
  v < 3.5  # in this case anything below 3.5

end
p hash


=end

# 10 .Can hash values be arrays? Can you have an array of hashes? (give examples)


# yes

=begin

hash = {names:['jake','tom','doug']}

array = [{number:1, name:'zane'}, {place:'here', time: 12}]

=end



# 11. Given the following data structures, write a program that copies the information from the array into the empty hash that applies to the correct person.



=begin

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

p contacts["Joe Smith"] # we enter the hash with the first key, "Joe smith" It is currently empty
 contacts["Joe Smith"][:email] = contact_data[0][0] #now we assign it to the contact_data array indexes that we want. There are two subarrays and since this Is Joe Smith we want the first one. [0]. now we know we want his email so within the first array we have to find the index with the email. that is [0]
 contacts["Joe Smith"][:address] = contact_data[0][1] # same idea here but now we change from email to address. which switched the second index to [1]
 contacts["Joe Smith"][:phone] = contact_data[0][1]
 contacts["Sally Johnson"][:email] = contact_data[1][0] # Sally Johnson's information is in subarray 2. so we choose index [1]
 contacts["Sally Johnson"][:address] = contact_data[1][1]
 contacts["Sally Johnson"][:phone] = contact_data[1][2]
 p contacts


# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

=end

# 12. Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number.


=begin

contacts = {
     "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
     "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
      }

    p  contacts["Joe Smith"][:email]   #to find the specific value, simply wrap the key in square brackets. We want to find the value of the email. Email is another key so we would follow with square brackets for it
    p contacts ["Sally Johnson"][:phone]

=end


=begin
    # 13. use Ruby's Array method delete_if and String method start_with? to delete all of the strings that begin with an "s" in the following array.
    # Then recreate the arr and get rid of all of the strings that start with "s" or starts with "w".



    arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
    arr2 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']


    arr.delete_if {|string| string.start_with?'s'}
    arr2.delete_if{|string|string.start_with?"s","w"}
    p arr
    p arr2


=end



# 14. take the following array and turn it into a new array that consists of strings containing one word.
#(ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method.

=begin

  def change_to_one_word
    a = ['white snow', 'winter wonderland', 'melting ice',
      'slippery sidewalk', 'salted roads', 'white trees']

     a = a.map {|string|string.split()} # splits the words up onto a 2dim array

     a = a.flatten  # changed the array into a single array

    end

      p change_to_one_word
      a= a.flatten
      p a
=end

      # 15. What will the following program output?
=begin
      hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end


# although the hashes are in different orders. The key:value pairs are the same. Thus, they passed as true in the above program.

# That is not the case for Arrays. They rely on order on their indexes.

=end

# 16. In exercise 11, we manually set the contacts hash values one by one.
#Now, programmatically loop or iterate over the contacts hash from exercise 11, and populate the associated data from the contact_data array.
 #Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

#Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:

#contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
#contacts = {"Joe Smith" => {}}
=begin

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]


contacts = {"Joe Smith" => {}}


The first prints 3 to the screen. The second throws an error undefined local variable or method because x is not available as it is created within the scope of the do/end block.
fields =  [:email, :address, :phone] # first we must create an array with our key info that we need. In this case :email, :address, and :phone


contacts.each do |key, hash| # we must first iterate through our contacts hash.
  fields.each do |field|   # next we iterate through our fields array so we have access to it.
  hash[field] = contact_data.shift # now we take our empty hash value and set the field key to it. Afterwards we assign that to contact_data.shift
                                   # that assignment makes it so we iterate our hash value with the field keys and assign them to our first array in contact_data
  end                                # those would be :email => "joe@email.com", :address =>  "123 Main st", :phone => "555-123-4567"
end
 p contacts
=end



# bonus : same as abobe but with both entries in the hash

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}




fields =  [:email, :address, :phone]


contacts.each_with_index do |(key, hash),idx| # use each_with_index to add third parameter which is the index of the entries
  fields.each do |field|
  hash[field] = contact_data[idx].shift # add the idx as an index to contact_data and it will assign the hash[field] at the proper index
  end
end
p contacts

