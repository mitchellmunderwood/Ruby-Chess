module Slideable
  HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
  DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    moves_dir.each do |dir|
      dx,dy = dir
      moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    moves
  end

  private

  def grow_unblocked_moves_in_dir(dx,dy)
    unblocked_moves = []
    conditional = true
    new_pos = self.pos
    current_pos = self.pos
    n = 1
    while conditional
      x,y = current_pos
      nx,ny = x+dx*n,y + dy*n
      new_pos = [nx,ny]
      break unless Board.valid_pos?(new_pos)
      if @board[nx,ny].name == 'Null'
        n += 1
        unblocked_moves << new_pos
      elsif @board[nx,ny].color != self.color
        unblocked_moves << new_pos
        conditional = false
      else
        conditional = false
      end
    end
    unblocked_moves
  end


end
