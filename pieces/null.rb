require_relative 'piece'
require 'singleton'

class Null < Piece
  include Singleton

  #only thing it seems the Nullpiece class inherits is the attr_reader
  def initialize
    @name = 'Null'
    @color = nil
  end
end
