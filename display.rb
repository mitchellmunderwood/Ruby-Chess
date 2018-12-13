load 'board.rb'
load 'cursor.rb'
require 'colorize'

SYMBOL_MAP = {
  "Pawn" => ' ♟ ',
  "Castle" => ' ♜ ',
  "Bishop" => ' ♝ ',
  "Knight" => ' ♞ ',
  "Queen" => ' ♛ ',
  "King" => ' ♚ ',
  "Null" => '   '
}


class Display
  attr_reader :board, :cursor

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], board)
  end

  #render a static board with pieces and colors
  #render a dynamic board with cursor movement and updates
  #render a dynamic board with cursor constraints

  def render
    @board.rows.each_index do |row_ind|
      @board.rows[row_ind].each_index do |square_ind|
        #get the right char from the symbol map
        piece = @board[row_ind, square_ind]
        piece_color = piece.color == "black" ? :black : :white
        piece_sym = SYMBOL_MAP[piece.name]
        # set the symbol for the colorize method
        (row_ind + square_ind) % 2 == 0 ? back_color = :blue : back_color = :red
        # #render time
        print piece_sym.colorize(:color => piece_color, :background => back_color)
      end
      print "\n"
    end
  end

end
