require_relative 'piece'
require_relative 'steppingpiece'

class King < Piece
  include Stepable

  def initialize(board, color, name, pos)
    super
  end

  def diffs
    [
      [1,1],
      [-1,1],
      [1,-1],
      [-1,-1],
      [0,1],
      [1,0],
      [0,-1],
      [-1,0]
    ]
  end

end
