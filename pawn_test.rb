require_relative 'board.rb'
require_relative 'display.rb'

board = Board.new
display = Display.new(board)
display.render
print board[6,0].moves
print "\n"
board.move_piece([1,0],[3,0])
board.move_piece([6,1],[4,1])
display.render
print board[3,0].moves
print "\n"
