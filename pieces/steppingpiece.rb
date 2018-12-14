module Stepable
  def moves
    moves = []
    x,y = @pos
    diffs.each do |diff|
      dx,dy = diff
      moves << [x+dx,y+dy]
    end

    good_moves = moves.select do |pos|
      x,y = pos
      @board[x,y].color != self.color || @board[x,y].name == "Null"
    end

    good_moves
  end

end
