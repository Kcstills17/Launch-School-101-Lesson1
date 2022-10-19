# 1. How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end



# 2. How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|  # since all values are of the same type they can all be compared using <=> and the sort_by method can be used quite simply here
 book[:published]

  end



  # 3. For each of these collection objects demonstrate how you would reference the letter 'g'.


  arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}


p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1['b'][1]
p hsh2[:third].keys[0] # or
p hsh2[:third].key(0)


# 4. For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

 arr1[1][1] = 4
p arr1[1][1]

 arr2[2] = 4
p arr2[2]

 hsh1[:first][2][0] = 4
p hsh1[:first][2][0]

p hsh2[['a']][:a][2] = 4
p hsh2[['a']][:a][2]

# 5. Given this nested hash

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family

total = 0
 munsters.each do |k, v |
  p total += v['age'] if v['gender'] == 'male'
 end

# 6.  One of the most frequently used real-world string properties is that of "string substitution",
#     where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:
=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

like this

(Name) is a (age)-year-old (male or female).

=end

munsters.each_pair do |hash|
p "#{hash[0]} is a #{hash[1]["age"]} year old #{hash[1]['gender']}"
end


# 7. Given this code, what would be the final values of a and b? Try to work this out without running the code.


a = 2
b = [5, 8]
 arr = [a, b]
# arr = [2,[5,8]]
 arr[0] += 2
# arr[4,[5,8]]
  arr[1][0] -= 2
# arr [4, [3, 8]]

# 8. Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, v|
  v.each do |string|
     string.chars do |element|
       element if %w[a e i o u ].include?(element)
    end
  end
end


# 9. Given this data structure, return a new array of the same structure but with the
# sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |lists|
 lists.sort do |a, b|
  b <=> a
 end
  end


  # 10. Given the following data structure and without modifying the original array, use the map
  # method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

   [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
    new_hash = {}
    hsh.each do |k, v |
      new_hash[k] = v += 1
    end
    new_hash
   end

   # 11. Given the following data structure use a combination of methods, including either the select or reject method,
  # to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

  arr2 = [[2], [3, 5, 7], [9], [11, 13, 15]]

  arr2.map do |element1|
    element1.select do |element2|
    element2 % 3 == 0
    end
  end


# 12.  Given the following data structure, and without using the Array#to_h method, write some code that will return a hash
# where the key is the first item in each sub array and the value is the second item.

arr3 = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}



 result_hash = {}
 arr3.each do |element|
  result_hash[element[0]] = element[1]
   result_hash
 end


 # 13. Given the following data structure, return a new array containing the same sub-arrays as
# the original but ordered logically by only taking into consideration the odd numbers they contain.
# result should look like [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

numbers = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

numbers.sort_by do |arr|
  arr.select do |num|  # sort_by takes the result of the method select
    num.odd?   # select evaluates as to true for all num values that are true for .odd?
  end          #sort_by then uses the values returned as true from select as the basis as its sorting order
end


# 14. Given this data structure write some code to return an array containing the colors of the fruits
# and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

fruit_hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# expected return value: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


fruit_hsh.map do |_, v |
 if  v[:type] == 'fruit'
  v[:colors].map do |c|
  c.upcase
 end
elsif v[:type] == 'vegetable'
   v[:size].upcase
 end
 end

 # 15. Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

 hash_arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

hash_arr.select do |group|
  group.all? do |_, arr|
     arr.all? do |num|
       num.even?
    end
  end
end


# 16. A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be
# created by the same system. That is, without any form of synchronization, two or more separate computer systems
# can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

#It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

#Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

#It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

#Write a method that returns one UUID when called with no parameters.


=begin
P. Understand the Problem
  Explicit Requirements:
  - create a method that returns one UUID when called with no parameters
  - UUID consist of 32 hexadecimal characters, broken into 5 sections 8-4-4-4-12
  - represented as a string


  Implicit Requirements:
  -

  Clarifications/ Questions:
  - there are 16 symbols in hexadecimal. These symbols or values are 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E and F.

E: Examples/ Edge Cases
 -

D: Data Structures
  - no input
  - output: string


A: Algorithm
- create a constant HEXY that contains the 16 hexadecimal units
  def uuid()
    - set random_result equal to ''
    - until random_result.size is equal to 36
      - set variable sample equal to HEXY.sample
      - append sample to random_result
    - end
    - set random_result at index 8, 13, 18, 23,  equal to  '-'
    return random_result
  end

C: Code with intent


=end

HEXY = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f ]

def uuid()
  random_result = ''
  until random_result.size == 36
    sample = HEXY.sample
    random_result += sample
  end
  p random_result[8] = '-'
  random_result[13] = '-'
  random_result[18] = '-'
  random_result[23] = '-'
   random_result
end

 uuid




# LS Solution
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

 generate_UUID



order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},

]

customer_orders = {}

order_data.each do |row|
  if customer_orders.key?(row[:customer_id])
    customer_orders[row[:customer_id]][:orders] << {
      order_fulfilled: row[:order_fulfilled],
      order_value: row[:order_value]
    }
  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        {
          order_fulfilled: row[:order_fulfilled],
          order_value: row[:order_value]
        }
      ]
    }
  end
end

customer_orders = customer_orders.values


=begin
customer_orders = temp_orders.values
p customer_orders

 original correct answer
[{:customer_id=>12, :customer_name=>"Emma Lopez", :orders=>[{:order_fulfilled=>true, :order_value=>135.99}, {:order_fulfilled=>true, :order_value=>289.49}, {:order_fulfilled=>false, :order_value=>58.0}]}, {:customer_id=>32, :customer_name=>"Michael Richards", :orders=>[{:order_fulfilled=>true, :order_value=>120.0}, {:order_fulfilled=>false, :order_value=>85.65}]}]

Answer number 1
[{:customer_id=>12, :customer_name=>"Emma Lopez", :orders=>[[true, 135.99], [true, 289.49], [false, 58.0]]}, {:customer_id=>32, :customer_name=>"Michael Richards", :orders=>[[true, 120.0], [false, 85.65]]}]

 Answer number 2
 [{:customer_name=>"Emma Lopez", :customer_id=>12, :orders=>[{:order_fulfilled=>false, :order_value=>58.0}]}, {:customer_name=>"Michael Richards", :customer_id=>32, :orders=>[{:order_fulfilled=>false, :order_value=>85.65}]}]

 Answer number 3
 [{:customer_id=>12, :customer_name=>"Emma Lopez", :orders=>[{:order_fulfilled=>true, :order_value=>135.99}, {:order_fulfilled=>true, :order_value=>289.49}, {:order_fulfilled=>false, :order_value=>58.0}]}, {:customer_id=>32, :customer_name=>"Michael Richards", :orders=>[{:order_fulfilled=>true, :order_value=>120.0}, {:order_fulfilled=>false, :order_value=>85.65}]}]

 Answer number 4
 [{:customer_id=>12, :customer_name=>"Emma Lopez", :orders=>[{:order_fulfilled=>true, :order_value=>135.99}]}, {:customer_id=>12, :customer_name=>"Emma Lopez", :orders=>[{:order_fulfilled=>true, :order_value=>289.49}]}, {:customer_id=>12, :customer_name=>"Emma Lopez", :orders=>[{:order_fulfilled=>false, :order_value=>58.0}]}, {:customer_id=>32, :customer_name=>"Michael Richards", :orders=>[{:order_fulfilled=>true, :order_value=>120.0}]}, {:customer_id=>32, :customer_name=>"Michael Richards", :orders=>[{:order_fulfilled=>false, :order_value=>85.65}]}]

 =end


















# what reconstructed data should look like

=begin
customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },

]

=end




all_orders = []

all_orders = []

customer_orders.each do |customer_data|
  cust_arr = [
    [:customer_id, customer_data[:customer_id]],
    [:customer_name, customer_data[:customer_name]],
    [:total_order_value]
  ]

  order_value = 0
  customer_data[:orders].each do |order|
    order_value += order[:order_value]
  end

  cust_arr[2] << order_value

  all_orders << cust_arr
end
p all_orders




fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
   if order[:order_fulfilled]
    total += order[:order_value]
   else
    total
   end
  end
p fulfilled_orders[index][:order_value]
   fulfilled_orders[index][:order_value] = order_value
end
p fulfilled_orders

=begin

correct answer
[{:customer_id=>12, :customer_name=>"Emma Lopez", :total_order_value=>483.48}, {:customer_id=>32, :customer_name=>"Michael Richards", :total_order_value=>205.65}]

answer 1
[{:customer_id=>12, :customer_name=>"Emma Lopez", :total_order_value=>483.48}, {:customer_id=>32, :customer_name=>"Michael Richards", :total_order_value=>205.65}]
answer 2
[{:customer_id=>12, :customer_name=>"Emma Lopez", :total_order_value=>483.48}, {:customer_id=>32, :customer_name=>"Michael Richards", :total_order_value=>205.65}]
answer 3
[{:customer_id=>12, :customer_name=>"Emma Lopez", :total_order_value=>483.48}, {:customer_id=>32, :customer_name=>"Michael Richards", :total_order_value=>205.65}]
answer 4
[[[:customer_id, 12], [:customer_name, "Emma Lopez"], [:total_order_value, 483.48]], [[:customer_id, 32], [:customer_name, "Michael Richards"], [:total_order_value, 205.65]]]


=end
