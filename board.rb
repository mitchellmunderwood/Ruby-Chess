require 'byebug'

class Board
  attr_reader :rows

  def initialize
    setup_board
  end

  def self.valid_pos?(pos)
    x,y = pos
    x.between?(0,7) && y.between?(0,7) ? true : false
  end

  def move_piece(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    raise "no starting piece here" if self[start_row, start_col] == nil
    raise "can't place piece here" unless end_row.between?(0,7) && end_col.between?(0,7)
    start_piece = self[start_row, start_col]
    self[end_row, end_col] = start_piece
    self[start_row, start_col] = "nil"
    start_piece.change_pos(end_pos)
  end

  def [](row,column)
    @rows[row][column]
  end

  def []=(row,column,value)
    @rows[row][column] = value
  end

  private

  def setup_board
    @rows = Array.new(8) {Array.new(8, "nil")}
    #setup black pieces
    setup_board_pawns(1,"black")
    black_row = ["Castle","Bishop","Knight","Queen","King","Knight","Bishop","Castle"]
    setup_board_pieces(0, black_row,"black")
    #setup white pieces
    setup_board_pawns(6,"white")
    white_row = ["Castle","Bishop","Knight","King","Queen","Knight","Bishop","Castle"]
    setup_board_pieces(7, white_row,"white")
    #setup null pieces
    (2..5).each { |row| setup_board_nullpieces(row) }
  end


  def setup_board_pawns(row_num, color)
    @rows[row_num].each_index do |index|
      self[row_num,index] = Piece.new("Pawn",[row_num,index],color)
    end
  end

  def setup_board_pieces(row_num, pieces, color)
    @rows[row_num].each_index do |index|
      self[row_num, index] = Piece.new(pieces[index],[row_num,index],color)
    end
  end

  def setup_board_nullpieces(row_num)
      @rows[row_num].each_index do |index|
        self[row_num, index] = NullPiece.new("Null",[row_num,index], 'none')
      end
  end
end
