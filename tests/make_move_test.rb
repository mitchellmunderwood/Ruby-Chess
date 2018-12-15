require_relative '../board.rb'
require_relative '../display.rb'
require_relative '../player.rb'

board = Board.new
display = Display.new(board)
player = HumanPlayer.new('white',display)
puts player.make_move(board)
