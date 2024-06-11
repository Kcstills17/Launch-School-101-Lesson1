#Creating my own times method

# regular times method

#5.times {|num| p num}

#creating our own times method and block  implementation


def times(number)
counter = 0
while counter <= number do
  yield(counter)
  counter += 1
end
  number
end

times(5) do |num|
 # puts num
end


# creating our own each method and block implementation


def each(arr)
  counter = 0

 while counter < arr.size do
  yield(arr[counter])
  counter  +=  1
 end
 arr
end

each([1, 2, 3, 4, 5]) do |num|
  # puts  num
end


# creating our own reduce method and block implementation


def reduce(arr, default = 0 )
  accu = default
  number = 0

  while number < arr.size
    yield(accu, arr[number])
    accu += arr[number]
    number += 1
  end
  p accu

end



reduce([300, 3, 8, 9], 100) {|acc, num| acc + num}





def true_or_false(&block)
  puts "The block is #{block.call}"
end

def call_chunk(code_chunk)
  code_chunk.call
end
color = "blue"
say_color = Proc.new {puts "The color is #{color}"}

call_chunk(say_color)
