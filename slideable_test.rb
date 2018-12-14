#rework the board, pieces, and display classes to
  # remove the name from the pieces class
  # add unique symbols to the piece specific class and not store them in display, colorize those native pieces, employ the #symbol method


# get each piece a class
#   make sure the methods and calls and state all line up
#
# build a board
#   change the positions of pawns so that spaces are available for moves
#   render the board
#
#
# check the #moves function for all slideable pieces (bishop, rook, queen)
#   should return an array of positions open based on board piece positions

require_relative 'board.rb'
require_relative 'display.rb'

board = Board.new
display = Display.new(board)
board.move_piece([0,3],[4,4])
display.render
p board[4,4].name
p board[4,4].moves
