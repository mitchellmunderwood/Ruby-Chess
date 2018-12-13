load 'board.rb'
load 'cursor.rb'
require 'colorize'

SYMBOL_MAP = {
  "Pawn" => ['♟','♙'],
  "Castle" => ['♜','♖'],
  "Bishop" => ['♝','♗'],
  "Knight" => ['♞','♘'],
  "Queen" => ['♛','♕'],
  "King" => ['♚','♔'],
  "nil" => [' ',' ']
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
    @board.each_index do |row_ind|
      row.each_index do |square_ind|
        piece = @board[row_ind, square_ind]
        piece_color = piece.color == "black" ? 0 : 1
        piece_sym = SYMBOL_MAP[piece.name][piece_color]

        row_ind + square_ind % 2 == 0 ? back_color = :blue : back_color = :red


      puts "\n"
    end
  end

end
