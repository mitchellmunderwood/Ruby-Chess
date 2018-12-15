require_relative 'board.rb'
require_relative 'display.rb'

board = Board.new
display = Display.new(board)
board.move_piece([0,1],[2,0])
display.render
p board[2,0].name
p board[2,0].moves
