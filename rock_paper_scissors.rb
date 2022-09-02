RPS = {
  rock: ["scissors", "lizard"],
  paper: ["scissors", "spock"],
  scissors: ["paper", "lizard"],
  spock: ["rock", "scissors"],
  lizard: ["spock", "paper"]
}
p RPS.key(["scissors", "lizard"])

begin VALID_CHOICES = ['r', 'p', 's']
      def prompt(message)
        Kernel.puts("=> #{message}")
      end

      def win?(first, second)
        first == (RPS.key(["scissors", "lizard"]) && second == RPS[:rock]) ||
          first == (RPS.key(["scissors", "spock"]) && second == RPS[:paper]) ||
          first == (RPS.key(["paper", "lizard"]) && second == RPS[:scissors]) ||
          first == (RPS.key(["rock", "scissors"]) && second == RPS[:spock]) ||
          first == (RPS.key(["spock", "paper"]) && second == RPS[:lizard])
      end

      def display_results(player, computer)
        if win?(player, computer)
          prompt("You win")
        elsif win?(computer, player)
          prompt("You lose")
        else
          prompt("You tie")
        end
      end

      def rounds(user, cpu); end

      puts "=> Welcome to the Rock Paper Scissors Game! Press anything to begin"
      gets.chomp

      loop do
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
        rounds(user_choice, computer_choice)
      end
end
