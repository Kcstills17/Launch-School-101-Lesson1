  if  other_move.paper?
      puts "Paper drives Spock mad"
      return true
    elsif other_move.lizard?
      puts "Lizard frightens Spock to death"
      return true
    end
  end
  false