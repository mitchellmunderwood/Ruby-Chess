require_relative 'piece'
require_relative 'slidingpiece'

class Queen < Piece
  include Slideable

  def initialize(board, color, name, pos)
    super
  end

  def moves_dir
    horizontal_dirs + diagonal_dirs
  end

end
