load 'board.rb'
require 'colorize'

class Display
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def render

  end

end
