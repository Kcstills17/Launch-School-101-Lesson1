def prompt(string)
  puts "=> #{string}"
end

def display_board(brd)
puts ""
puts "     |     |"
puts " #{brd[1]}  | #{brd[2]}  | #{brd[3]}"
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts " #{brd[4]}  | #{brd[5]}  | #{brd[6]}"
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts " #{brd[7]}  | #{brd[8]}  | #{brd[9]}"
puts "     |     |"
puts ""

end


def initiallize_board()
  new_board = {}
  (1..9).each {|num| new_board[num] = "  "}
  new_board
end

board = initiallize_board  # set initiallize_board as a variable to be accessed throughout the program

display_board(board)  # use board to access our key:value pairs onto out display_board method


 def empty_board(brd)  # place_pieces_user! logic was getting a bit too complex. we could take a large chunk of the validation logic and create a new method
  brd.keys.select {|num|brd[num] = ''}  # this method allows the program to realize to only accept the input when the value of the inputted key is not taken
 end


def player_places_piece!(brd)
  square = ''
  loop do
prompt("choose  a square #{empty_board(brd)}):")
 square = gets.chomp.to_i
 if empty_board(brd).include?(square)
  break
 else
  prompt("this is not a valid input. please try again")
 end
end
 brd[square]  = ' x'
end


p player_places_piece!(board)
p display_board(board)
