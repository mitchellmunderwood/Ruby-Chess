class Piece
  attr_reader :board,:name, :pos, :color

  def initialize(board, color, name, pos)
    @board = board
    @color = color
    @name = name
    @pos = pos

    @board[pos.first,pos.last] = self
  end

  def change_pos(pos)
    @pos = pos
  end

  def valid_moves
    moves.reject { |end_pos| moves_into_check?(end_pos) }
  end

  def moves_into_check?(end_pos)
    test_board = board.dup
    test_board.move_piece(pos,end_pos)
    test_board.in_check?(color)
  end


end
