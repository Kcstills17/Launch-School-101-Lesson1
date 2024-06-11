number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1

}

keys =  number_of_pets.keys
values = number_of_pets.values

counter = 0

loop do
  curent_pet = keys[counter]
  current_number = values[counter]
 puts "I have #{current_number} #{curent_pet}"
counter += 1
 break if counter >= keys.size
end



str = "joe's favorite color is blue"
p str.split.map {|char| char.capitalize }.join(" ")


arr = [1, 2, 3, 4, 5]
p arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
p arr
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }

hsh[:apple] = "fruit"
hsh[:carrot] = "vegetable"
hsh[:pear] = "fruit"
hsh[:broccoli] = "vegetable"
p

alphabet = 'abcdefghijklmnopqrstuvwxyz'

array = [25, 24, 16, 9, 12, 18]

array.reduce do |sum, total|
  sum += total
   sum
end
 # iterating through a hash pair
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}

p pets = number_of_pets.keys  # first we should get our keys to loop through. We can use the #keys method to create an array of them here.
counter = 0

while  counter < number_of_pets.size
  current_pet =  pets[counter]  # we set a variable to what is each pet in the iteration.
  current_pet_number =  number_of_pets[current_pet]   # we set a variable to contain the value of the hash or current_pet_number here.
  puts "I  have #{current_pet_number}  #{current_pet} and  "
  counter +=1

end


