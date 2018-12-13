class Piece
  attr_reader :name, :pos, :color, :deltas

  def initialize(name, pos, color, deltas = [], board = nil)
    @board = board
    @name = name
    @pos = pos
    @color = color
    @deltas = deltas
  end

  def change_pos(pos)
    @pos = pos
  end

  def moves
    moves = @deltas.map do |delta|
      x,y = pos
      dx,dy = delta
      [x+dx, y+dy]
    end
    moves.select {|pos| Board.valid_pos?(pos)}
  end

end
