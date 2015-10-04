
class AI
  attr_accessor  :current_player
  def initialize(game_rules)
    @game_rules = game_rules
  end

  WIN, TIE, LOSS, IN_PROGRESS_SCORE = 500, 0, -500, 100

  def find_best_move(board, opponent_piece, game_piece)
    possible_moves = {}
    current_player = game_piece
    depth = 1

    return 4 if empty?(board)

    open_spaces_on(board).each do |move|
      cloned_board = board.clone
      make_move(cloned_board, move, current_player)
      score = rank(cloned_board, depth, opponent_piece, game_piece)
      track_best(move, score, possible_moves)
      new_score = score_available_moves(board, depth + 1, next_player(current_player, opponent_piece, game_piece), score, opponent_piece, game_piece)
      if new_score > score
        score = new_score
      end
      board = reset(board, move)
    end
    best_move(possible_moves)
  end

  def open_spaces_on(board)
    board.size.times.select {|i| board[i] == nil}
  end

  private

  def empty?(board)
    board.count(nil) == 9
  end

  def score_available_moves(board, depth, current_player, score, opponent_piece, game_piece)
    return score if @game_rules.game_over?(board)
    open_spaces_on(board).each do |move|
      make_move(board, move, current_player)
      if current_player == opponent_piece
        score = score_available_moves(board, depth + 1, next_player(current_player, opponent_piece, game_piece), score, opponent_piece, game_piece) * -1
      else
        score = score_available_moves(board, depth + 1, next_player(current_player, opponent_piece, game_piece), score, opponent_piece, game_piece)
      end
      board = reset(board, move)
    end
    return score
  end

  def track_best(move, score, possible_moves)
    possible_moves[move] = score
  end

  def best_move(possible_moves)
    best_score = possible_moves.values.max
    possible_moves.key(best_score)
  end

  def next_player(current_player, opponent_piece, game_piece)
    current_player == opponent_piece ? game_piece : opponent_piece
  end

  def reset(board, move)
    board[move] = nil
    board
  end

  def make_move(board, move, current_player)
    board[move] = current_player
    board
  end

  def rank(board, depth, opponent_piece, game_piece)
    if @game_rules.game_over?(board)
      return TIE - depth if @game_rules.tie?(board)
      return WIN - depth if @game_rules.winner(board) == game_piece
      return LOSS - depth if @game_rules.winner(board) == opponent_piece
    else
      return IN_PROGRESS_SCORE
    end
  end
end



class GameRules
  attr_accessor :current_player
  def valid?(board, move)
    board[move.to_i] == nil && move.to_i < 9
  end

  def full?(board)
    board.count(nil) == 0
  end

  def tie?(board)
    full?(board) == true && winner(board) == false
  end

  def game_over?(board)
    full?(board) || winner(board)
  end

   def winner(board)
    [first_row(board),
     second_row(board),
     third_row(board),
     left_column(board),
     middle_column(board),
     right_column(board),
     left_diag_winner(board),
     right_diag_winner(board)
    ].each do |set|
      if set.uniq.count == 1
        if set[0] != nil
          return set[0]
        end
      end
    end
    false
  end

  def tie?(board)
    full?(board) == true && winner(board) == false
  end

  def game_over?(board)
    full?(board) || winner(board)
  end

private

  def first_row(board)
    board[0..2]
  end

  def second_row(board)
    board[3..5]
  end

  def third_row(board)
    board[6..8]
  end

  def left_column(board)
    [board[0], board[3], board[6]]
  end

  def middle_column(board)
    [board[1], board[4], board[7]]
  end

  def right_column(board)
    [board[2], board[5], board[8]]
  end

  def left_diag_winner(board)
    [board[0], board[4], board[8]]
  end

  def right_diag_winner(board)
    [board[2], board[4], board[6]]
  end
end
