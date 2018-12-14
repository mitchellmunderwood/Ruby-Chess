module Stepable
  def moves
    moves = []
    x,y = @pos
    diffs.each do |diff|
      dx,dy = diff
      new_pos = [x+dx,y+dy]
      moves << new_pos if Board.valid_pos?(new_pos)
    end

    good_moves = moves.select do |pos|
      x,y = pos
      @board[x,y].color != self.color || @board[x,y].name == "Null"
    end

    good_moves
  end

end
