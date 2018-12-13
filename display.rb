load 'board.rb'
load 'cursor.rb'
require 'colorize'

# SYMBOL_MAP = {
  # "Pawn" => ['♟','♙'],
  # "Castle" => ['♜','♖'],
#   "Bishop" => ['♝','♗'],
#   "Knight" => ['♞','♘'],
#   "Queen" => ['♛','♕'],
#   "King" => ['♚','♔'],
#   "Null" => [' ',' ']
# }

SYMBOL_MAP = {
  "Pawn" => ['P','P'],
  "Castle" => ['C','C'],
  "Bishop" => ['B','B'],
  "Knight" => ['K','K'],
  "Queen" => ['Q','Q'],
  "King" => ['Ki','Ki'],
  "Null" => [' ',' ']
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
        piece_color = piece.color == "black" ? 0 : 1
        piece_sym = SYMBOL_MAP[piece.name][piece_color]
        # set the symbol for the colorize method
        back_color = nil 
        (row_ind + square_ind) % 2 == 0 ? back_color = :blue : back_color = :red
        # #render time
        p piece_sym.colorize(:color => :green ,:background => :red)
      end
      puts "\n"
    end
  end
end


display = Display.new
display.render
