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
    self[start_row, start_col] = @sentinel 
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
    setup_board_non_royals(0,"black")
    setup_board_non_royals(7,"white")
    setup_board_royals

  end

  def setup_board_non_royals(row_num, color)
    self[row_num,0] = Rook.new(self, color, 'Rook', [row_num,0])
    self[row_num,1] = Knight.new(self, color, 'Knight', [row_num,1])
    self[row_num,2] = Bishop.new(self, color, 'Bishop', [row_num,2])
    self[row_num,5] = Bishop.new(self, color, 'Bishop', [row_num,5])
    self[row_num,6] = Knight.new(self, color, 'Knight', [row_num,6])
    self[row_num,7] = Rook.new(self, color, 'Rook', [row_num,7])
  end

  def setup_board_royals
    self[0,4] = King.new(self, 'black', 'King', [0,4])
    self[7,3] = King.new(self, 'white', 'King', [7,3])
    self[0,3] = Queen.new(self, 'black', 'Queen', [0,3])
    self[7,4] = Queen.new(self, 'white', 'Queen', [7,4])
  end

  def setup_board_pawns(row_num, color)
    @rows[row_num].each_index do |index|
      self[row_num,index] = Pawn.new(self, color, "Pawn",[row_num,index])
    end
  end

  def setup_board_nullpieces(row_num)
      @rows[row_num].each_index do |index|
        self[row_num, index] = self.sentinel
      end
  end
end
