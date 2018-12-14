require_relative 'piece'
require_relative 'steppingpiece'

class Pawn < Piece
  include Stepable
  def initialize(board, color, name, pos)
    super
  end

  def diffs
    [[1,0],
     [2,0]
    ]
  end
end
