require 'byebug'

class Board
  def initialize
    setup_board
  end

  def move_piece(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    raise "no starting piece here" if board[start_pos] == nil
    raise "can't place piece here" unless end_row.between?(0,7) && end_col.between?(0,7)
    start_piece = @rows[start_pos]
    @rows[end_pos] = start_piece
    @rows[start_pos] = nil
  end

  def [](row,column)
    @rows[row][column]
  end

  def []=(row,column,value)
    @rows[row][column] = value
  end

  def setup_board
    @rows = Array.new(8) {Array.new(8, "nil")}
    #setup black pieces
    setup_board_pawns(1,"black")
    black_row = ["C","B","Kn","Q","K","Kn","B","C"]
    setup_board_pieces(0, black_row,"black")
    #setup white pieces
    setup_board_pawns(6,"white")
    white_row = ["C","B","Kn","K","Q","Kn","B","C"]
    setup_board_pieces(7, white_row,"white")
  end


  def setup_board_pawns(row_num, color)
    @rows[row_num].each_index do |index|
      self[row_num,index] = Piece.new("P",[row_num,index],color)
    end
  end

  def setup_board_pieces(row_num, pieces, color)
    @rows[row_num].each_index do |index|
      self[row_num, index] = Piece.new(pieces[index],[row_num,index],color)
    end
  end

end

class Piece
  def initialize(name, position, color)
    @name = name
    @pos = position
    @color = color
  end
end

# class NullPiece < Piece
# end
