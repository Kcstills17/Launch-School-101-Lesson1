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
  %w[l sp] => 'poison'
}

p RPS[%w[r s]]

loop do
  begin VALID_CHOICES = %w[r p s sp l]
        def prompt(message)
          Kernel.puts("=> #{message}")
        end

        def win?(first, second)
          if action = RPS[[first, second]]
            prompt("#{first} #{action} #{second}")
            second
          elsif action = RPS[[second, first]]
            prompt("#{second} #{action} #{first}")

          end
        end

        def display_results(player, computer)
          if win?(player, computer)
            prompt("You Win")
          elsif win?(computer, player)
            prompt("You Lose")
          else
            prompt("You tie")

          end
        end

        def display_score(user, cpu)
          player_score = 0
          cpu_score = 0

          loop do
            prompt("Choose out of the five #{VALID_CHOICES.join(', ')}")
            user = gets.chomp
            cpu = VALID_CHOICES.sample

            if win?(user, cpu)

              display_results(user, cpu)
              player_score += 1
              prompt("your score : #{player_score} opponent's score : #{cpu_score}")

              break if player_score == 3

            elsif win?(cpu, user)
              display_results(user, cpu)
              cpu_score += 1
              break if cpu_score == 3
              prompt("your score : #{player_score} opponent's score : #{cpu_score}")
            elsif user == cpu
              prompt("You Tie")
              prompt("your score : #{player_score} opponent's score : #{cpu_score}")
            else
              prompt("please input a valid choice")
            end
          end
        end

        puts "=> Welcome to the Rock Paper Scissors Game! Press anything to begin"
        gets.chomp

        user_choice = nil
        loop do
          prompt("Choose out of the five #{VALID_CHOICES.join(', ')}")
          user_choice = gets.chomp

          break if VALID_CHOICES.include?(user_choice.downcase)
          puts "That is not a valid choice"
        end
        computer_choice = VALID_CHOICES.sample

        prompt("you choose #{user_choice.downcase} and your opponent chooses #{computer_choice.downcase}")
        display_results(user_choice, computer_choice)
        display_score(user_choice, computer_choice)
  end

  prompt("would you like to play again?")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?("y")
end
