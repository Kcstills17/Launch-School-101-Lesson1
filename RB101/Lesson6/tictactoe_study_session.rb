=begin


def place_piece(board, current_player)
    current_player == PLAYER_MARKER ? player_places_piece : computer_places_piece
  end

  def alternate_player(current_player)
    current_player = (current_player == PLAYER_MARKER ? COMPUTER_MARKER : PLAYER_MARKER)
  end

  loop do
    board = initiallize_board
    current_player = game_order == 'first' ? PLAYER_MARKER : COMPUTER_MARKER

    loop do
      display_board(board)
      who_won_or_is_tie(user_score, cpu_score, board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    who_won_or_is_tie(user_score, cpu_score, board)
    break if user_score.join.to_i == 5 || cpu_score.join.to_i == 5
  end

  system "clear"
    prompt "#{detect_winner(board)} wins the game by a total score of #{user_score.join.to_i} to #{cpu_score.join.to_i}"
    prompt("would you like to play again? (Y/N)")
    play_again = gets.chomp
    break unless play_again.downcase.start_with?('y')
  end
  prompt(" (￣ε￣〃)ｂ Thank you for playing Tic-Tac-Toe. Goodbye  ʘ‿ʘ) ╯ ✧･ﾟ: *✧･ﾟ:*")


  # TIC TAC TOE

  # BEGIN GAME
  # DO THE MAIN LOOP
    # CHOOSE PLAYER
    # PLAY A GAME LOOP
      #
       #
        #


=end
