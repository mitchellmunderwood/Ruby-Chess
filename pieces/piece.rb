class Piece
  attr_reader :name, :pos, :color, :deltas

  def initialize(board, color, name, pos)
    @board = board
    @color = color
    @name = name
    @pos = pos
  end

  def change_pos(pos)
    @pos = pos
  end

  def moves

  end

end
