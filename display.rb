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

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

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
        back_color = :green if [row_ind,square_ind] == @cursor.cursor_pos
        print piece_sym.colorize(:color => piece_color, :background => back_color)
      end
      print "\n"
    end
    return nil
  end

end

system "clear"
display = Display.new(Board.new)
display.render
while display.cursor.cursor_pos != [7,7]
  display.cursor.get_input
  system "clear"
  display.render
end
puts "the test is over"
