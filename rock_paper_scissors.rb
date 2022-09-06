RPS = {
  %w[r s] => 'crushes',
  %w[r l] => 'crushes',
  %w[p r] => 'covers',
  %w[p sp] => 'disproves',
  %w[s p] => 'cuts',
  %w[s l] => 'decapitates',
  %w[sp r] => 'vaporizes',
  %w[sp sc] => 'smashes',
  %w[l p] => 'eats',
  %w[l sp] => 'poisons'
}

VALID_CHOICES = %w[r p s sp l]
def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  if first == second
    prompt("You Tie")


  elsif action = RPS[[first, second]]
    prompt("Good Work! #{first} completely #{action} #{second}")
    [first, second]



  elsif action = RPS[[second, first]]
    prompt("Oh No! #{second}  #{action} #{first}. You've still got this!")
    [second, first]


  end

end

def display_score(user, cpu)
  prompt("Alright. Now you get the jigg. Make your pick!")
  cpu_score = 0
  your_score = 0
  loop do
    user = gets.chomp
    cpu = 'p'
    if VALID_CHOICES.include?(user) == false
      prompt("please enter a valid input")

     elsif win?(user, cpu) == [user, cpu]
      your_score += 1
      break if your_score == 3
      prompt("your score #{your_score} opponent's score #{cpu_score}")
    elsif win?(cpu, user) == [cpu, user]
      cpu_score += 1
      break if cpu_score == 3
      prompt("your score #{your_score} opponent's score #{cpu_score}")
    else
      prompt("Your choices are equal.")
    end
  end
  prompt("Final Score : #{your_score} to : #{cpu_score}")
end
loop do
  user_choice = nil
  cpu_choice = nil
  player_score = nil
  computer_score = nil

  prompt("Welcome to our Upgraded Rock Paper Scissors Game! Please enter anything to begin ")
  enter_game = gets.chomp
  loop do
    prompt("Practice: enter r, p, s, sp, or l. This will not be scored ")
    user_choice = gets.chomp
    cpu_choice = VALID_CHOICES.sample
    player_score = 0
    computer_score = 0

    break if VALID_CHOICES.include?(user_choice)
    prompt("Please enter one of the valid choices")
  end
  display_score(user_choice, cpu_choice)

  prompt("Thank You for enjoying our game. Please notify us if you would like to play again")
  play_again = gets.chomp
  break unless play_again.start_with?('y'.downcase)
end
