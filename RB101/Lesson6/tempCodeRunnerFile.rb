loop do
    board = initiallize_board

    loop do
      display_board(board)
      who_won_or_is_tie(user_score, cpu_score, board)
      game_order == 'first' && game_order!= 'cpu' ? player_places_piece!(board) : computer_places_piece!(board)

      break if someone_won?(board) || board_full?(board)
      display_board(board)
      who_won_or_is_tie(user_score, cpu_score, board)
      (game_order == 'first') &&  game_order != 'cpu' ? (computer_places_piece!(board)) : (player_places_piece!(board))
      break if someone_won?(board) || board_full?(board)

    end

    display_board(board)