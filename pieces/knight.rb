require_relative 'piece'
require_relative 'steppingpiece'

class Knight < Piece
  include Stepable
  def initialize(board, color, name, pos)
    super
  end

  def diffs
    [
      [2,1],
      [-2,1],
      [2,-1],
      [-2,-1],
      [1,2],
      [-1,2],
      [1,-2],
      [-1,-2]
    ]
  end
end
