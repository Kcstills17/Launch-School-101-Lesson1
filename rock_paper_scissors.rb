RPS = {
  r: ["scissors", "lizard"],
  p: ["scissors", "spock"],
  s: ["paper", "lizard"],
  sp: ["rock", "scissors"],
  l: ["spock", "paper"]
}
p RPS.key(["scissors", "lizard"]).to_s

begin VALID_CHOICES = ['r', 'p', 's', 'sp', 'l']
      def prompt(message)
        Kernel.puts("=> #{message}")
      end

      def win?(first, second)
        first == (RPS.key(["scissors", "lizard"]) && second == RPS[:r]) ||
          first == (RPS.key(["scissors", "spock"]) && second == RPS[:p]) ||
          first == (RPS.key(["paper", "lizard"]) && second == RPS[:s]) ||
          first == (RPS.key(["rock", "scissors"]) && second == RPS[:sp]) ||
          first == (RPS.key(["spock", "paper"]) && second == RPS[:l])
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
      end
end
