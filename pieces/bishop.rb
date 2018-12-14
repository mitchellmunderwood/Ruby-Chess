require_relative 'piece'
require_relative 'slidingpiece'

class Bishop < Piece
  include Slideable

  def initialize(board, color, name, pos)
    super
  end

  def moves_dir
    diagonal_dirs
  end

end
