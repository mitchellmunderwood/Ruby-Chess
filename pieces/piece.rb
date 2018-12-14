load 'board.rb'

class Piece
  attr_reader :name, :pos, :color, :deltas

  def initialize(name, pos, color, board = nil)
    @board = board
    @name = name
    @pos = pos
    @color = color
  end

  def change_pos(pos)
    @pos = pos
  end

  def moves

  end

end
