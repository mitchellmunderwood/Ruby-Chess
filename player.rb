require_relative 'display'

class Player
  attr_reader :color ,:display

  def initialize(color, display)
    @color = color
    @display = display
  end

end

class HumanPlayer < Player

  def make_move(board)
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render
      if start_pos
        puts "#{color}'s move, select placement location"
        end_pos = display.cursor.get_input
        display.reset! if end_pos
      else
        puts "#{color}'s move. Move from where"
        start_pos = display.cursor.get_input
        display.reset! if start_pos
      end
    end

    [start_pos, end_pos]
  end
end

class ComputerPlayer < Player
  def initialize(color, display)
    super
  end

  def make_move(board)
  end
end
