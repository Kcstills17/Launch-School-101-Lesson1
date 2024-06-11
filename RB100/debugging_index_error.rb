colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i ==[colors.length, things.length].min  #initially set to break if i > colors.length. but the  colors index is 7 while the things index is 6.
                               # therefore to make sure i breaks out when the smaller array's length is surpassed there is a good method to use to find out.
  if i == 0                    # using .min we can decide between two parameters and tell i to break if it is == to either one of them.
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end
p things.length - 1
  p i += 1
end
