require 'byebug'
require_relative 'pieces'

class Board
  attr_reader :rows, :sentinel

  def initialize(setup = true)
    @sentinel = Null.instance
    setup_board if setup
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

  def in_check?(color)
    #get the king's position
    king = @rows.flatten.select { |piece| piece.name == 'King' && piece.color == color}.first
    king_pos = king.pos
    #get all opponents possible moves
    opponent_moves = []
    @rows.flatten.each do |piece|
      if piece.name != 'Null' && piece.color != color
        opponent_moves += piece.moves
      end
    end
    #see if any moves can strike the king
    opponent_moves.any? {|move| move == king_pos}
  end

  def checkmate?(color)
    # in_check(color) && run through the board result of ever possible valid_moves of all your players if all of those scenarios are all in_check as well, then checkmate is true
  end

  def [](row,column)
    @rows[row][column]
  end

  def []=(row,column,value)
    @rows[row][column] = value
  end

  def dup
    new_board = Board.new(false)
    rows.flatten.each do |piece|
      piece.class.new(new_board, piece.color, piece.name, piece.pos)
    end
    new_board
  end

  private

  def setup_board
    @rows = Array.new(8) {Array.new(8, "nil")}
    (2..5).each { |row| setup_board_nullpieces(row) }
    setup_board_pawns(1,"black")
    setup_board_pawns(6,"white")
    setup_board_pieces(0,"black")
    setup_board_pieces(7,"white")
  end

  def setup_board_pieces(row_num, color)
    self[row_num,0] = Rook.new(self, color, 'Rook', [row_num,0])
    self[row_num,1] = Knight.new(self, color, 'Knight', [row_num,1])
    self[row_num,2] = Bishop.new(self, color, 'Bishop', [row_num,2])
    self[row_num,3] = Queen.new(self, color, 'Queen', [row_num,3])
    self[row_num,4] = King.new(self, color, 'King', [row_num,4])
    self[row_num,5] = Bishop.new(self, color, 'Bishop', [row_num,5])
    self[row_num,6] = Knight.new(self, color, 'Knight', [row_num,6])
    self[row_num,7] = Rook.new(self, color, 'Rook', [row_num,7])
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
