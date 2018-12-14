require_relative 'board.rb'
require_relative 'display.rb'

board = Board.new
display = Display.new(board)
board.move_piece([1,5],[2,5])
board.move_piece([6,4],[4,4])
board.move_piece([7,3],[3,7])
display.render
board.move_piece([1,6],[3,6])

print "\n"
