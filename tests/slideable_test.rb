require_relative 'board.rb'
require_relative 'display.rb'

board = Board.new
display = Display.new(board)
board.move_piece([0,3],[4,4])
display.render
p board[4,4].name
p board[4,4].moves
