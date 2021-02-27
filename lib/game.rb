require_relative 'player'
require_relative 'board'

# Creates a tic tac toe game
class Game
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @winner = ''
  end

  def start
    loop do
      play until player_wins || board_full
      print_board
      if player_wins
        print_winner
        increment_score
      else
        print_draw
      end

      play_again? ? restart_game : break
    end

    print_final_score
  end

  private

  def starting_player
    rnd_number = rand(2)

    rnd_number.zero? ? @player1.turn = true : @player2.turn = true
  end

  def player_wins
    winner?(@player1) ? true : winner?(@player2)
  end

  def winner?(player)
    @board.game_over?(player) ? (@winner = player; true) : false
  end

  def board_full
    @board.full?
  end

  def print_winner
    puts "\n#{@winner} wins!"
  end

  def print_draw
    puts "\nDraw!"
  end

  def play
    print_board

    if @player1.turn?
      turn(@player1)
      @player1.turn = false
      @player2.turn = true
    else
      turn(@player2)
      @player2.turn = false
      @player1.turn = true
    end
  end

  def print_board
    puts @board
  end

  def turn(player)
    marker_added = false

    until marker_added
      marker_location = player.play
      @board.added_marker?(marker_location, player.marker) ? marker_added = true : invalid_marker_location
    end
  end

  def invalid_marker_location
    puts "\nYour marker could not be added on the desired location.\nPlease choose another location on the board"
  end

  def increment_score
    if @winner == @player1
      @player1.wins += 1
    else
      @player2.wins += 1
    end
  end

  def play_again?
    puts "\nDo you want to play again? (Y/N)"
    input = gets.chomp.upcase

    until input.match(/^[YN]$/i)
      puts "\nPlease type Y/N"
      input = gets.chomp.upcase
    end

    input == 'Y'
  end

  def restart_game
    @board.clear_board
    @winner = ''
  end

  def print_final_score
    puts "\nFinal score: #{@player1.name}: #{@player1.wins} wins, #{@player2.name}: #{@player2.wins} wins"
  end
end
