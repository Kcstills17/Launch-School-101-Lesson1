# creating a palindrome with ruby

def palindrome(word,reverse_word)
  if word.upcase == reverse_word.reverse.upcase
      puts "this is a pallindrome" +" " + "#{word} and #{reverse_word}"
  else
        puts "false. #{word} is not #{reverse_word} backwards"
  end
end

palindrome("CAT A", "tac")

palindrome('dog', 'terry')

palindrome("hello", "olleh")
