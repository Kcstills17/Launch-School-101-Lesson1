  player_winning_count = brd.values_at(*line).count(PLAYER_MARKER) == 2 && empty_board(brd).each do |num|
    p num
    sqr = num
    end
  end
end