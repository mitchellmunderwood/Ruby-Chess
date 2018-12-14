require 'byebug'
require_relative 'pieces'

class Board
  attr_reader :rows, :sentinel

  def initialize
    @sentinel = Null.instance
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
    (2..5).each { |row| setup_board_nullpieces(row) }
    setup_board_pawns(1,"black")
    setup_board_pawns(6,"white")
    # black_row = ["Rook","Bishop","Knight","Queen","King","Knight","Bishop","Rook"]
    # setup_board_pieces(0, black_row,"black")
    #setup white pieces

    # white_row = ["Rook","Bishop","Knight","King","Queen","Knight","Bishop","Rook"]
    # setup_board_pieces(7, white_row,"white")
    #setup null pieces

  end


  def setup_board_pawns(row_num, color)
    @rows[row_num].each_index do |index|
      self[row_num,index] = Pawn.new(self, color, "Pawn",[row_num,index])
    end
  end

  def setup_board_pieces(row_num, pieces, color)
    @rows[row_num].each_index do |index|
      self[row_num, index] = pieces[index].constantize.new(self, color, pieces[index],[row_num,index])
    end
  end

  def setup_board_nullpieces(row_num)
      @rows[row_num].each_index do |index|
        self[row_num, index] = self.sentinel
      end
  end
end
