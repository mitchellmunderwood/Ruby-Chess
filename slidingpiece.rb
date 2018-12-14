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
    move_dirs.each do |dir|
      dx,dy = dir
      moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    moves
  end

  private

  def move_dirs

  end

  def grow_unblocked_moves_in_dir(dx,dy)
    unblocked_moves = []
    conditional = true  
    new_pos = self.pos
    current_pos = self.pos
    n = 1
    while conditional && Board.valid_pos?(new_pos)
      x,y = current_pos
      new_pos = [x+dx*n,y + dy*n]
      if @board[new_pos].name == 'Null'
        n += 1
        unblocked_moves << new_pos
      elsif @board[new_pos].color != self.color
        unblocked_moves << new_pos
        conditional = false
      elsif new_pos.has_friend?
        conditional = false
      end
    end
    unblocked_moves
  end


end
