require_relative 'piece'

class Pawn < Piece
  def initialize(board, color, name, pos)
    super
  end

  def moves
    step_moves + slide_moves
  end

  def step_moves
    x,y = @pos
    moves = []
    if x == 1 || x == 6
      @color == 'black' ? moves << [x+2,y] : moves << [x-2,y]
    end

    if @color == 'black'
      new_pos = [x+1,y]
      moves << new_pos if Board.valid_pos?(new_pos)
    else
      new_pos = [x-1,y]
      moves << new_pos if Board.valid_pos?(new_pos)
    end
    moves
  end

  def slide_moves
    x,y = @pos
    moves = []
    if @color == 'white'
      moves << [x-1,y-1] if Board.valid_pos?([x-1,y-1]) && @board[x-1,y-1].color == 'black'
      moves << [x-1,y+1] if Board.valid_pos?([x-1,y+1]) && @board[x-1,y+1].color == 'black'
    else
      moves << [x+1,y-1] if Board.valid_pos?([x+1,y-1]) && @board[x+1,y-1].color == 'white'
      moves << [x+1,y+1] if Board.valid_pos?([x+1,y+1]) && @board[x+1,y+1].color == 'white'
    end
    moves
  end

end
