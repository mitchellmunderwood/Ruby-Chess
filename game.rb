require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :display, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(board)
    @players = {1 => HumanPlayer.new('black',display), 2 => HumanPlayer.new('white',display)}
    @current_player = 1
  end

  def play
    puts "this"
    until board.checkmate?('white') || board.checkmate?('black')
      begin
       start_pos, end_pos = @players[current_player].make_move(board)
       board.move_piece(start_pos, end_pos)
       swap_turn!
       notify_players
      rescue StandardError => e
        @display.notifications[:error] = e.message
        retry
      end
     puts "#{@player[current_player].color} is checkmated."
     nil
    end

  end

  private

  def notify_players
    if board.in_check?(@players[current_player])
      display.set_check!
    else
      display.uncheck!
    end
  end

  def swap_turn!
    @current_player = current_player == 1 ? 2 : 1
  end


end

if @PROGRAM_NAME == __FILE__
  Game.new.play
end
